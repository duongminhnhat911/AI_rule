# Lesson Learned & Post-Mortem: [Tên Lỗi / Sự Cố / Lỗ Hổng Bảo Mật]
> **Mục tiêu:** Lưu trữ bài học kinh nghiệm xương máu sau khi fix lỗi để không bao giờ tái phạm ở bất kỳ dự án nào.

---

## 📌 1. Thông Tin Sự Cố (Incident Metadata)
* **Ngày phát hiện & xử lý:** [YYYY-MM-DD]
* **Lĩnh vực / Stack:** [Ví dụ: Web Backend (.NET) / Game (Unity C#) / Mobile (Flutter)]
* **Mức độ rủi ro:** [Critical (Mất dữ liệu, lỗi bảo mật, sập hệ thống) | High (Sai logic nghiệp vụ) | Medium (Lỗi hiển thị, gián đoạn nhỏ)]
* **Phạm vi kế thừa:**
  - [ ] **Cục bộ dự án:** Chỉ ghi vào `project_context/04_gotchas_and_quirks.md`.
  - [ ] **Toàn cục hệ thống:** Cần nâng cấp thành luật chung trong `domain_standards/` (Web, Game, App, Mobile).

---

## 🔍 2. Phân Tích Nguyên Nhân Gốc Rễ (Root Cause Analysis)
* **Hiện tượng lỗi (Symptom):** [Ví dụ: Người dùng bấm mua vật phẩm lúc mạng lag bị trừ tiền 2 lần nhưng chỉ nhận 1 món đồ].
* **Nguyên nhân cốt lõi (Root Cause):** [Ví dụ: Đọc số dư ra rồi mới kiểm tra và trừ tiền trong code C#, không bọc Transaction hoặc thiếu điều kiện Atomic Update ở tầng CSDL dẫn đến Race Condition khi có 2 request đồng thời].

---

## ⚡ 3. So Sánh Mã Nguồn: Sai vs Đúng

### ❌ Anti-Pattern (Đoạn mã gây lỗi cần tuyệt đối tránh):
```csharp
// Mô tả tại sao đoạn code này nguy hiểm:
var balance = await _db.GetBalance(userId);
if (balance >= itemPrice)
{
    // BỊ LỖI: Request thứ hai lọt vào đây trước khi dòng dưới kịp ghi vào DB
    await _db.UpdateBalance(userId, balance - itemPrice);
    await _db.AddItem(userId, itemId);
}
```

### ✅ Defensive Pattern (Đoạn mã phòng thủ chuẩn đã kiểm chứng):
```csharp
// Giải pháp chuẩn: Bọc Transaction Serializable hoặc dùng câu lệnh Atomic Update trực tiếp ở DB:
using var transaction = await _context.Database.BeginTransactionAsync(IsolationLevel.Serializable);
try
{
    int rowsAffected = await _context.Database.ExecuteSqlRawAsync(
        "UPDATE Accounts SET Balance = Balance - {0} WHERE Id = {1} AND Balance >= {0}", 
        itemPrice, userId);

    if (rowsAffected == 0)
        throw new InsufficientBalanceException("Số dư không đủ hoặc giao dịch bị hủy.");

    await _inventoryService.AddItemAsync(userId, itemId);
    await transaction.CommitAsync();
}
catch
{
    await transaction.RollbackAsync();
    throw;
}
```

---

## 🛡️ 4. Quy Tắc Phòng Vệ Vĩnh Viễn (The Permanent Guardrail)
*Từ nay về sau, khi viết tính năng tương tự, AI và lập trình viên bắt buộc phải:*
1. [Ví dụ: Mọi thao tác trừ tiền, trừ điểm, trừ kho hàng BẮT BUỘC dùng Atomic Update hoặc Transaction].
2. [Ví dụ: Nút bấm ở Client phải có debounce và disable ngay khi vừa click].

# CORE PROTOCOL 03: TESTING & EMPIRICAL VERIFICATION
> **Mục tiêu:** Chứng minh mã nguồn đã thực sự chạy đúng trước khi kết thúc tác vụ. Không chấp nhận câu trả lời "Em nghĩ là code đã chạy được rồi".

---

## 1. Nguyên Tắc "Chứng Minh Bằng Thực Nghiệm" (Empirical Proof)
1. **Bắt buộc có kiểm chứng trước khi báo hoàn thành:**
   - Khi viết tính năng mới hoặc sửa bug, AI **phải tự động kiểm tra biên dịch (Compiler check)** hoặc chạy bộ kiểm thử ngầm (Unit Test / Linter / Diagnostics).
   - Nếu không có test suite tự động, phải in ra kết quả chạy script kiểm tra hoặc test log trong terminal để chứng minh giải pháp hoạt động.
2. **Kiểm tra biên dịch theo từng Stack:**
   - **.NET / C#:** `dotnet build --no-restore` hoặc kiểm tra log Unity Editor.
   - **TypeScript / React / Next.js:** `npm run build` hoặc `npx tsc --noEmit`.
   - **Python:** `python -m pytest` hoặc `python -m py_compile <file>`.
   - **Flutter / Dart:** `flutter analyze` hoặc `dart test`.
   - **Rust / Tauri:** `cargo check`.
3. **Phân tích Stack Trace khi gặp lỗi:**
   - Khi lệnh test thất bại: Đọc kỹ dòng lỗi, tên file và số dòng gây ra ngoại lệ.
   - Không đoán mò nguyên nhân. Xác định đúng nguyên nhân gốc (Root Cause) $\rightarrow$ Đề xuất phương án $\rightarrow$ Sửa $\rightarrow$ Chạy lại test.

---

## 2. Quy Chuẩn Viết Unit Test & Mock
1. **Cấu trúc chuẩn AAA (Arrange - Act - Assert):**
   ```csharp
   [Test]
   public void CalculateDamage_WhenArmorApplied_ShouldReduceCorrectly()
   {
       // Arrange
       var player = new Player(baseArmor: 20);
       int rawDamage = 50;

       // Act
       int finalDamage = CombatCalculator.Calculate(rawDamage, player.Armor);

       // Assert
       Assert.AreEqual(30, finalDamage);
   }
   ```
2. **Kiểm thử các trường hợp biên (Boundary & Edge Cases):**
   - Giá trị `null`, `undefined`, chuỗi rỗng `""`.
   - Số âm, số 0, số cực lớn (Overflow).
   - Danh sách rỗng `[]`, danh sách có 1 phần tử, danh sách 10.000 phần tử.
   - Network timeout hoặc API trả về mã lỗi 4xx/5xx.

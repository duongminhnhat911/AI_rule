# DOMAIN STANDARD: WEB DEVELOPMENT — BACKEND & API ARCHITECTURE
> **Mục tiêu:** Tiêu chuẩn thiết kế Backend API (.NET / Node.js / Python / Go), Clean Architecture, CQRS, chuẩn RESTful & gRPC và quản lý Database giao dịch.

---

## 1. Thiết Kế RESTful API Chuẩn Mực
1. **Quy tắc đặt tên Endpoint (Resource-Oriented):**
   - Danh từ số nhiều: `/api/v1/users`, `/api/v1/orders`.
   - Quan hệ phân cấp: `/api/v1/orders/{orderId}/items`.
   - Không dùng động từ trong URI: Dùng `POST /api/v1/orders` thay vì `/api/v1/createOrder`.
2. **Quy chuẩn Mã Trạng Thái HTTP (Status Codes):**
   - `200 OK`: Trả về dữ liệu thành công.
   - `201 Created`: Tạo mới tài nguyên thành công (kèm URI ở header Location).
   - `204 No Content`: Xóa hoặc cập nhật thành công nhưng không trả về body.
   - `400 Bad Request`: Sai format dữ liệu đầu vào.
   - `401 Unauthorized`: Chưa đăng nhập hoặc token không hợp lệ.
   - `403 Forbidden`: Đã đăng nhập nhưng không đủ quyền (Role/Permission).
   - `404 Not Found`: Không tìm thấy tài nguyên.
   - `409 Conflict`: Trùng lặp dữ liệu (Unique constraint violation).
   - `500 Internal Server Error`: Lỗi logic hệ thống (phải che giấu stack trace nhạy cảm).

---

## 2. Kiến Trúc Phân Tầng Clean Architecture
```text
[API / Controllers] ──> [Application / Use Cases] ──> [Domain Models / Entities]
                                │
                                ▼
                    [Infrastructure / Database / External Services]
```
1. **Domain Layer:** Chứa Entities thuần, Enums, Domain Exceptions. Không phụ thuộc vào bất kỳ framework bên ngoài nào.
2. **Application Layer:** Chứa DTOs, Interfaces, Commands/Queries (MediatR), Business Validators.
3. **Infrastructure Layer:** Cài đặt Repository, DbContext (EF Core, Prisma, TypeORM), Cache (Redis), Email, Payment Gateway.
4. **API Layer:** Tiếp nhận HTTP Request, gọi MediatR / Service tương ứng và trả về `ActionResult<T>`.

---

## 3. Quản Lý Transaction & Database Migration
1. **Nguyên tắc ACID:**
   - Các thao tác liên quan đến tiền bạc, điểm thưởng hoặc inventory **bắt buộc** phải bọc trong Database Transaction:
     ```csharp
     using var transaction = await _context.Database.BeginTransactionAsync();
     try
     {
         await DeductBalanceAsync(userId, amount);
         await AddItemToInventoryAsync(userId, itemId);
         await _context.SaveChangesAsync();
         await transaction.CommitAsync();
     }
     catch
     {
         await transaction.RollbackAsync();
         throw;
     }
     ```
2. **Đánh Index Khôn Ngoan:**
   - Mọi cột dùng trong `WHERE`, `JOIN`, `ORDER BY` thường xuyên (như `user_id`, `created_at`, `status`) phải được đánh Index (B-Tree).
   - Tránh đánh Index bừa bãi làm chậm tốc độ `INSERT`/`UPDATE`.

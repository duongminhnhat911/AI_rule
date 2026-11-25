# DOMAIN STANDARD: WEB DEVELOPMENT — SECURITY & OWASP DEFENSE
> **Mục tiêu:** Phòng thủ các lỗ hổng bảo mật phổ biến nhất theo chuẩn OWASP Top 10, bảo vệ API, xác thực và dữ liệu người dùng.

---

## 1. Phòng Chống SQL Injection (SQLi)
- **Tuyệt đối KHÔNG ghép chuỗi trong câu lệnh SQL:**
  ```csharp
  // ❌ NGUY HIỂM:
  string query = $"SELECT * FROM Users WHERE Username = '{inputUsername}'";

  // ✅ AN TOÀN: Dùng Parameterized Query hoặc ORM (EF Core, Dapper, Prisma)
  var user = await _context.Users.FirstOrDefaultAsync(u => u.Username == inputUsername);
  ```

---

## 2. Xác Thực & Phân Quyền (AuthN & AuthZ)
1. **JWT (JSON Web Token) Best Practices:**
   - **Access Token:** Hạn ngắn (15 - 30 phút), lưu trong memory hoặc HTTP-Only cookie.
   - **Refresh Token:** Hạn dài hơn (7 ngày), lưu an toàn trong Database để có thể thu hồi (Revocation / Blacklist) khi người dùng đổi mật khẩu hoặc bị hack.
   - Luôn xác thực chữ ký (Signature), Issuer, Audience và Hạn dùng (Exp).
2. **Cơ chế Phân quyền chặt chẽ:**
   - Bảo vệ Endpoint theo Role/Policy (ví dụ: `[Authorize(Roles = "Admin,Developer")]`).
   - Kiểm tra quyền sở hữu tài nguyên (Object-Level Authorization): Đảm bảo User A không thể sửa hồ sơ của User B chỉ bằng cách đổi ID trên URL (`IDOR vulnerability`).

---

## 3. Bảo Vệ Dữ Liệu Đầu Vào & Chống XSS / CSRF
1. **Kiểm tra dữ liệu đầu vào (Input Sanitization & Validation):**
   - Validate độ dài, định dạng email, ký tự đặc biệt bằng thư viện (FluentValidation, Zod, Joi).
   - Mã hóa HTML (HTML Encode) khi hiển thị dữ liệu do người dùng nhập lên giao diện để triệt tiêu XSS.
2. **Cấu hình Headers Bảo Mật:**
   - Bật **CORS** chỉ định rõ domain frontend được phép truy cập, không để `Access-Control-Allow-Origin: *` trên các API cần xác thực cookie.
   - Cấu hình các HTTP Headers quan trọng:
     - `Content-Security-Policy (CSP)`
     - `X-Frame-Options: DENY` (Chống Clickjacking)
     - `X-Content-Type-Options: nosniff`
     - `Strict-Transport-Security (HSTS)`

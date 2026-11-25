# CORE PROTOCOL 04: SYSTEM SAFETY & DEFENSIVE GUARDRAILS
> **Mục tiêu:** Bảo vệ an toàn dữ liệu ổ đĩa, cơ sở dữ liệu và môi trường của người dùng khỏi các hành động tự ý nguy hiểm.

---

## 1. Ranh Giới An Toàn Dữ Liệu (Data Safety)
1. **Bảo vệ Cơ sở dữ liệu (Database Protection):**
   - Tuyệt đối KHÔNG tự ý chạy các lệnh: `DROP DATABASE`, `DROP TABLE`, `TRUNCATE TABLE`, hoặc migration làm mất dữ liệu sản xuất.
   - Khi cần thay đổi schema: Phải viết script migration có thể rollback (`Up()` và `Down()`).
2. **Bảo vệ Secrets & API Keys:**
   - Tuyệt đối KHÔNG hardcode API Key, Token bí mật, mật khẩu kết nối CSDL trực tiếp vào file mã nguồn.
   - Mọi thông tin nhạy cảm phải đọc từ biến môi trường (`.env`, `appsettings.json`, `Secrets Manager`).
   - Đảm bảo file `.env` luôn nằm trong `.gitignore`.
3. **Quy tắc tạo bản sao lưu (.bak) khi sửa đổi lớn:**
   - Với những file mã nguồn nhạy cảm cốt lõi hoặc file cấu hình hệ thống, phải luôn đảm bảo có thể rollback về trạng thái trước đó nếu việc sửa đổi gặp sự cố.

---

## 2. Kiểm Soát Lệnh Terminal Nguy Hiểm
1. **Danh sách lệnh bị cấm tuyệt đối (Blacklisted Commands):**
   - `rm -rf /`, `rmdir /s /q c:`, `format`, `diskpart`, `mkfs`.
   - Các lệnh can thiệp Registry Windows: `reg delete`.
   - Các lệnh ngắt mạng hoặc tắt máy: `shutdown`, `taskkill /f /im explorer.exe`.
2. **Quy tắc Chú thích Terminal:**
   - Mọi lệnh terminal chạy trên PowerShell hoặc Bash luôn phải có một dòng chú thích ngắn gọn phía trước:
     ```powershell
     # Kiểm tra trạng thái biên dịch dự án Backend
     dotnet build --no-restore
     ```

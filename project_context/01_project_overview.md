# PROJECT OVERVIEW & WORKING CONTEXT
> **Mục tiêu:** Cung cấp bức tranh toàn cảnh về dự án, môi trường chạy, thông số cổng (ports), tài khoản test và các "vùng cấm địa" không được tự ý sửa.

---

## 1. Thông Tin Tổng Quan (Project Identity)
* **Tên Dự Án:** [Ví dụ: MyWebApp / MyGameProject]
* **Mục Tiêu Chính:** [Mô tả ngắn gọn sản phẩm làm gì, cho ai dùng]
* **Tech Stack Chính:**
  * **Frontend / Client:** [Ví dụ: Unity 6 (C# 12) / Next.js 15 (React 19, Tailwind)]
  * **Backend / API:** [Ví dụ: ASP.NET Core 8 Web API, SignalR]
  * **Database & Cache:** [Ví dụ: PostgreSQL 16, Redis 7]
  * **Môi Trường / Container:** [Ví dụ: Docker Compose, Node.js 20 LTS, .NET 8 SDK]

---

## 2. Thông Số Môi Trường Phát Triển (Local Environment & Credentials)
* **Cổng dịch vụ (Ports):**
  * Backend API: `http://localhost:5000` (hoặc `https://localhost:7001`)
  * Frontend / Web Admin: `http://localhost:3000`
  * Database: `localhost:5432`
* **Tài khoản kiểm thử (Local Test Accounts):**
  * Admin Test: `admin@test.local` / `Admin@123456`
  * Player / User Test: `player1@test.local` / `Player@123456`
* **Lưu ý biến môi trường (.env):**
  * File mẫu: `.env.example`
  * Tuyệt đối không commit file `.env` chứa secret thật lên Git.

---

## 3. "Vùng Cấm Địa" — Không Được Tự Tiện Sửa (Do Not Touch Zones)
Liệt kê các thư mục, file hoặc module mà AI **tuyệt đối không được tự ý sửa hoặc xóa** trừ khi có chỉ thị trực tiếp từ người dùng:
1. `[Thư mục/File 1]`: [Lý do: Mã nguồn thư viện bên thứ 3 hoặc code auto-generated].
2. `[Thư mục/File 2]`: [Lý do: Cấu hình hạ tầng production nhạy cảm].
3. `[Thư mục/File 3]`: [Lý do: Module đã qua kiểm định nghiêm ngặt, đang ổn định].

---

## 4. Quy Ước Nhánh & Bàn Giao Nhóm (Team Conventions)
* **Nhánh làm việc cá nhân:** [Ví dụ: `feature/my-task` hoặc nhánh cá nhân]
* **Nhánh đồng bộ chính:** [Ví dụ: Nhánh `dev` hoặc `main`]
* **Lưu ý:** Luôn `git pull` nhánh chính về kiểm tra conflict trước khi yêu cầu tạo commit.

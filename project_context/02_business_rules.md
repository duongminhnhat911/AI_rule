# BUSINESS RULES & FUNCTIONAL SPECIFICATIONS
> **Mục tiêu:** Lưu trữ các quy định nghiệp vụ cốt lõi (Business Rules - BR) và danh sách tính năng (Use Cases - UC) đặc thù của dự án này để AI luôn code đúng logic yêu cầu.

---

## 1. Bảng Quy Định Nghiệp Vụ Cốt Lõi (Business Rules - BR)
Mọi đoạn code liên quan đến tính toán, kiểm tra quyền hạn, giao dịch hoặc gameplay phải đối chiếu đúng các mã BR này:

| Mã BR | Tên Quy Định Nghiệp Vụ | Công Thức / Logic Chi Tiết | File Triển Khai Trong Code |
| :--- | :--- | :--- | :--- |
| **BR-01** | [Ví dụ: Tăng HP Quái Vật Theo Tầng] | `FinalHP = BaseHP * (1 + 0.3 * (Floor - 1))` | `Assets/Script/Enemy/MobHealth.cs` |
| **BR-02** | [Ví dụ: Giới Hạn Phòng Co-op] | Tối đa 2 người chơi/phòng. Host tính AI, Client render | `Assets/Script/Network/LobbyController.cs` |
| **BR-03** | [Ví dụ: Phân Quyền Admin API] | Chỉ tài khoản có Role `Admin` hoặc `Developer` mới truy cập | `Controllers/AdminController.cs` |
| **BR-04** | [Ví dụ: Hạn Dùng Token Xác Thực] | Access Token: 15 phút. Refresh Token: 7 ngày | `Services/AuthService.cs` |

---

## 2. Danh Sách Use Cases & Trạng Thái Triển Khai (Use Cases - UC)
| Mã UC | Tên Ca Sử Dụng | Backend API | Client / UI | Trạng Thái Hiện Tại |
| :--- | :--- | :--- | :--- | :--- |
| **UC-01** | Đăng ký & Đăng nhập | `POST /api/v1/auth/login` | LoginModal | ✅ Đã hoàn thành |
| **UC-02** | Tạo phòng & Ghép trận | `SignalR /gameHub` | LobbyScreen | ⚠️ Đang hoàn thiện |
| **UC-03** | Bảng xếp hạng điểm số | `GET /api/v1/leaderboard` | LeaderboardPanel | ✅ Đã hoàn thành |
| **UC-04** | Mua vật phẩm / Nâng cấp | `POST /api/v1/shop/buy` | ShopView | ❌ Chưa triển khai |

---

## 3. Quy Ước Dữ Liệu & Ràng Buộc (Data Constraints)
* Quy định giá trị mặc định, min, max (ví dụ: Tên hiển thị tối đa 30 ký tự, mật khẩu tối thiểu 8 ký tự).
* Định dạng tiền tệ, ngày giờ chuẩn (`ISO 8601 UTC`).

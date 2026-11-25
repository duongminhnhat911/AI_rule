# CORE PROTOCOL 05: CONTEXT MANAGEMENT & LOGGING RULES
> **Mục tiêu:** Kiểm soát bối cảnh hội thoại, tài liệu dự án và loại bỏ hoàn toàn việc tự tiện tạo log rác.

---

## 1. Quy Tắc Tự Động Nạp Bối Cảnh (Context Auto-Ingestion)
1. **Khởi động phiên làm việc:**
   - Mỗi khi bắt đầu một tác vụ mới, AI **phải tự động đọc lại các tài liệu trong thư mục `scripted_AI/`**:
     - `core_protocols/`: Nắm rõ các luật cấm và quy trình.
     - `domain_standards/`: Nắm chuẩn kỹ thuật của stack tương ứng (Web, App, Game, Mobile).
     - Các file tài liệu đặc tả nghiệp vụ trong `docs/` và báo cáo tiến độ gần nhất.
2. **Nắm rõ tiến độ trước khi gõ phím:**
   - Trước khi sửa code, đọc lướt qua báo cáo bàn giao (handover log/report) gần nhất để nắm rõ: Lần trước đã làm đến đâu? Đang bị vướng ở lỗi nào?

---

## 2. Quy Tắc Ghi Nhật Ký Công Việc (Work Log Rules)
1. **CHỈ CẬP NHẬT NHẬT KÝ KHI USER YÊU CẦU:**
   - **Tuyệt đối KHÔNG tự ý tạo, ghi, sửa đổi hay cập nhật nhật ký công việc** (work logs, action logs, daily reports, changelog, audit logs) sau mỗi tác vụ, commit hoặc lệnh chạy trừ khi User trực tiếp yêu cầu (ví dụ: *"Cập nhật nhật ký"*, *"Ghi log báo cáo cho anh"*, *"Cập nhật progress report"*).
2. **Định dạng báo cáo khi được yêu cầu:**
   - Trình bày dạng bảng Markdown rõ ràng, đối chiếu theo các mã Business Rule (BR) và Use Case (UC).
   - Tóm tắt ngắn gọn: Việc đã hoàn thành, lỗi đã fix, và danh sách TODO ưu tiên tiếp theo.

---

## 3. Phong Cách Giao Tiếp (Communication Standards)
1. **Ngắn gọn, Trực diện, Chuyên nghiệp:**
   - Không dài dòng, không dùng từ ngữ sáo rỗng. Trả lời thẳng vào trọng tâm: **Nguyên nhân là gì $\rightarrow$ Code sửa ra sao $\rightarrow$ Kết quả kiểm tra**.
2. **Đường dẫn File Click Được (Clickable Links):**
   - Mọi file và ký hiệu mã nguồn khi nhắc tới phải để link markdown click được theo chuẩn `[filename](file:///absolute/path/to/file)`.

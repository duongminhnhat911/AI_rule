# DOMAIN STANDARD: MOBILE DEVELOPMENT — RESILIENCE, OFFLINE & BATTERY
> **Mục tiêu:** Đảm bảo ứng dụng di động chạy ổn định trong điều kiện mạng yếu, tiết kiệm pin, quản lý quyền hạn (Permissions) và đồng bộ dữ liệu ngoại tuyến (Offline-First).

---

## 1. Thiết Kế Ngoại Tuyến (Offline-First Architecture)
1. **Lưu Trữ Cục Bộ (Local Storage):**
   - Dùng SQLite (qua Drift/Isar trong Flutter hoặc WatermelonDB/OP-SQLite trong React Native) làm nguồn sự thật (Single Source of Truth) tại thiết bị.
   - Luồng dữ liệu chuẩn:
     $$\text{UI} \leftarrow \text{Local DB} \leftarrow \text{Sync Service} \leftrightarrow \text{Remote API}$$
   - Người dùng có thể xem và tương tác với dữ liệu ngay lập tức dù đang ở chế độ máy bay hoặc mất mạng.
2. **Hàng Đợi Đồng Bộ (Sync Queue):**
   - Mọi thao tác ghi dữ liệu khi mất mạng (tạo bài viết, thích bài, thêm giỏ hàng) được lưu vào hàng đợi cục bộ kèm cờ `is_pending = true`. Khi có mạng trở lại, một tiến trình chạy ngầm sẽ đẩy dữ liệu lên máy chủ theo thứ tự FIFO.

---

## 2. Tiết Kiệm Pin & Băng Thông Di Động (Battery & Data Throttling)
1. **GPS & Định Vị Vệ Tinh:**
   - Chỉ yêu cầu độ chính xác cao (`HighAccuracy`) khi ứng dụng đang chạy tính năng dẫn đường thời gian thực.
   - Khi chạy ngầm hoặc chỉ cần biết thành phố/quận huyện, hạ độ chính xác xuống `LowAccuracy` hoặc `BalancedPower` để giảm 80% hao pin.
2. **Debounce & Throttling Request:**
   - Các ô tìm kiếm tự động (Auto-complete) bắt buộc phải debounce ít nhất 300ms - 500ms trước khi gửi request lên server.
   - Nén ảnh (Image Compression) tại máy client trước khi upload lên Cloud Storage.

---

## 3. Quản Lý Quyền Hạn (Permissions Etiquette)
1. **Xin Quyền Đúng Ngữ Cảnh (Just-In-Time Permissions):**
   - Không xin hàng loạt quyền (Camera, Mic, Location, Thông báo) ngay khi vừa mở app lần đầu.
   - Chỉ xin quyền khi người dùng chuẩn bị thực hiện tính năng đó (ví dụ: bấm nút chụp ảnh mới xin quyền Camera).
2. **Giải Thích Rõ Lý Do:**
   - Luôn hiển thị một dialog giải thích ngắn gọn: *"Để quét mã QR thanh toán, ứng dụng cần sử dụng camera của bạn"* trước khi hiện hộp thoại xin quyền của hệ điều hành.

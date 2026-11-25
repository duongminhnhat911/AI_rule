# DOMAIN STANDARD: GAME PERFORMANCE & PHYSICS OPTIMIZATION
> **Mục tiêu:** Kiểm soát tốc độ khung hình (Frame Rate), giảm Draw Calls, tối ưu hóa va chạm vật lý và quản lý Asset mượt mà.

---

## 1. Tối Ưu Hóa Render & Giảm Draw Calls
1. **Batching (Gom nhóm hiển thị):**
   - Bật Static Batching cho toàn bộ vật cản tĩnh (tường, cột đá, sàn nhà).
   - Tối ưu Dynamic Batching hoặc GPU Instancing cho các đối tượng cùng chung Material và Shader (cây cối, đạn, quái lính).
2. **Quản Lý Material & Texture:**
   - Dùng **Texture Atlas** (ghép nhiều sprite/texture nhỏ vào 1 tấm lớn) để giảm chuyển đổi trạng thái render.
   - Luôn bật Mipmaps cho vật thể 3D trong không gian.

---

## 2. Vật Lý (Physics & Collision Rules)
1. **Vòng lặp Physics (`FixedUpdate` trong Unity / `TickPhysics` trong Unreal):**
   - Chỉ tính toán lực, vận tốc và va chạm (`Rigidbody.velocity`, `AddForce`) trong `FixedUpdate`.
   - Tuyệt đối không đọc Input chuột/phím trực tiếp trong `FixedUpdate` (đọc ở `Update` rồi lưu biến cờ).
2. **Tối ưu hóa Lớp Va Chạm (Collision Matrix):**
   - Thiết lập bảng va chạm chặt chẽ (Physics Layer Collision Matrix).
   - Không để mọi layer va chạm với nhau: Đạn người chơi chỉ va chạm với Quái và Tường; không tính va chạm giữa Đạn với Đạn hay Đạn với Người chơi.
3. **Ưu tiên Collider Đơn Giản (Primitive Colliders):**
   - Dùng Box, Sphere, Capsule Collider thay vì Mesh Collider. Nếu buộc phải dùng Mesh Collider, bắt buộc đánh dấu `Convex`.

---

## 3. Quản Lý Tài Nguyên Động (Asset Streaming & Addressables)
1. **Không nạp tài nguyên đồng bộ gây đứng hình (Hitch/Stutter):**
   - Tránh dùng `Resources.Load()` với các file nặng.
   - Sử dụng **Addressables** (Unity) hoặc **Soft Object References / Async Loading** (Unreal) để tải tài nguyên bất đồng bộ kèm thanh tiến trình.

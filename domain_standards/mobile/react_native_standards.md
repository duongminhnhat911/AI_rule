# DOMAIN STANDARD: MOBILE DEVELOPMENT — REACT NATIVE (EXPO)
> **Mục tiêu:** Tiêu chuẩn phát triển ứng dụng di động React Native hiện đại với Expo Router, Hermes Engine, Reanimated 3 và tối ưu hóa Bridge/JSI.

---

## 1. Expo Router & Cấu Trúc Thư Mục
1. **File-Based Routing:**
   - Cấu trúc thư mục theo `app/` directory (tương tự Next.js):
     - `app/(tabs)/`: Quản lý Bottom Tab Navigation.
     - `app/(auth)/`: Màn hình Đăng nhập/Đăng ký.
     - `app/_layout.tsx`: Root Layout chứa Providers, Theme và Toast.
2. **Kiến Trúc Expo Modules:**
   - Ưu tiên sử dụng Expo SDK Modules (`expo-camera`, `expo-location`, `expo-secure-store`) để tương thích tối đa với cả iOS và Android mà không cần link native code thủ công.

---

## 2. Animation & Thao Tác Cử Chỉ (Gesture & 60 FPS)
1. **React Native Reanimated 3:**
   - Mọi hiệu ứng chuyển động (Fade, Slide, Scale) **phải chạy trên UI Thread (Worklet)** thông qua `react-native-reanimated`.
   - Tuyệt đối không dùng thư viện `Animated` cũ của React Native trên các animation phức tạp vì nó chạy trên JS Thread gây giật/lag khi JS bận xử lý dữ liệu.
2. **Gesture Handler:**
   - Dùng `react-native-gesture-handler` (PanGesture, TapGesture) thay vì các component Touchable cơ bản khi làm các thao tác swipe, drag-to-dismiss.

---

## 3. Tối Ưu Bộ Nhớ & Danh Sách
1. **FlashList Thay Cho FlatList:**
   - Với danh sách từ 50 phần tử trở lên, ưu tiên dùng `@shopify/flash-list` thay cho `FlatList` thông thường để tái sử dụng cell (Recycled cells), tăng tốc độ cuộn gấp 5 lần và giảm 70% mức tiêu thụ RAM.
2. **Tối Ưu Ảnh:**
   - Dùng `expo-image` hỗ trợ caching đĩa, tự động nén kích thước và xử lý mượt mà định dạng WebP/AVIF.

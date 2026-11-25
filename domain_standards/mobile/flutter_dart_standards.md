# DOMAIN STANDARD: MOBILE DEVELOPMENT — FLUTTER & DART
> **Mục tiêu:** Tiêu chuẩn phát triển ứng dụng di động Flutter (Flutter 3.x / Dart 3), Sound Null Safety, State Management (Bloc / Riverpod) và Rendering Performance 60-120 FPS.

---

## 1. Sound Null Safety & Clean Architecture
1. **Dart 3 Best Practices:**
   - Sử dụng `sealed classes`, `pattern matching`, và `records` để mô hình hóa trạng thái (States) và kết quả nghiệp vụ (Result pattern).
   - Tuyệt đối tránh ép kiểu không an toàn bằng toán tử `!` (Force unwrap). Luôn dùng `if (value != null)` hoặc toán tử null-aware `?.`, `??`.
2. **Cấu Trúc Thư Mục Feature-First:**
   ```text
   lib/
   ├── core/                  # Network client, theme, utilities, error handlers
   └── features/
       ├── auth/
       │   ├── data/          # Repositories implementation, API datasources, Models
       │   ├── domain/        # Entities, Repository interfaces, Use cases
       │   └── presentation/  # Widgets, Screens, Bloc/Cubit
       └── shopping_cart/
   ```

---

## 2. Quản Lý Trạng Thái & Widget Tree Optimization
1. **Bloc / Cubit hoặc Riverpod:**
   - Tách biệt UI hoàn toàn khỏi business logic.
   - Không gọi HTTP request trực tiếp bên trong `State.initState()` hoặc hàm `build()`.
2. **Quy Tắc Vàng Giảm Re-Render:**
   - Luôn sử dụng từ khóa `const` trước các Widget tĩnh để Flutter bỏ qua việc dựng lại (rebuild) các widget này khi state cha thay đổi.
   - Tách nhỏ widget: Nếu một text field thay đổi giá trị, chỉ bọc `BlocBuilder` quanh text field đó chứ không bọc quanh toàn bộ `Scaffold`.
3. **Danh Sách Dài (Lists & Grids):**
   - **Bắt buộc** dùng `ListView.builder` hoặc `CustomScrollView` (Slivers) để Flutter chỉ nạp các phần tử đang hiển thị trên màn hình (Lazy loading). Cấm dùng `SingleChildScrollView` bọc quanh một `Column` chứa hàng trăm item.

---

## 3. Mẫu State Pattern Chuẩn Với Dart 3
```dart
sealed class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}
```

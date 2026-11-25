# DOMAIN STANDARD: DESKTOP APPS — SYSTEM RESILIENCE & OS HOOKS
> **Mục tiêu:** Kiểm soát vòng đời ứng dụng hệ thống, chạy nền ổn định, bắt phím tắt toàn cục và quản lý Single Instance an toàn.

---

## 1. Single Instance Protection (Chống Mở Nhiều Bản Sao)
- Ứng dụng Desktop chạy nền phải đảm bảo chỉ có duy nhất **1 tiến trình (Instance)** hoạt động cùng lúc.
- Dùng `Mutex` trên Windows / C# hoặc file lock trên Linux/macOS:
  ```csharp
  // C# Single Instance Pattern
  using var mutex = new Mutex(true, "MyUniqueApp_SingleInstance_GUID", out bool createdNew);
  if (!createdNew)
  {
      // Kích hoạt cửa sổ của instance đang chạy lên foreground và thoát
      return;
  }
  ```

---

## 2. Global Hotkeys & Native OS Hooks
1. **Đăng Ký Phím Tắt Toàn Cục (Alt+Space, Ctrl+Shift+K):**
   - Đảm bảo giải phóng hook (`UnregisterHotKey`) khi đóng ứng dụng để tránh rò rỉ tài nguyên hệ điều hành.
   - Tránh chiếm dụng các phím tắt hệ thống nhạy cảm của Windows (Ctrl+Alt+Del, Win+L, Alt+Tab).
2. **Quản Lý Bắt Lỗi Toàn Cục (Unhandled Exception Catch):**
   - Đăng ký `AppDomain.CurrentDomain.UnhandledException` và `TaskScheduler.UnobservedTaskException` để ghi log crash vào file ổ đĩa (`crash.log`) thay vì biến mất đột ngột mà không rõ lý do.

# DOMAIN STANDARD: DESKTOP APPS — .NET (AVALONIA / WPF)
> **Mục tiêu:** Tiêu chuẩn phát triển ứng dụng máy tính đa nền tảng bằng C# (.NET 8/9, Avalonia UI, WPF), mô hình MVVM và xử lý Async UI.

---

## 1. Mô Hình MVVM Chuẩn Mực (Model - View - ViewModel)
1. **Sử Dụng CommunityToolkit.Mvvm:**
   - Dùng Source Generators để code gọn, sạch, không viết boilerplate code thủ công:
     ```csharp
     using CommunityToolkit.Mvvm.ComponentModel;
     using CommunityToolkit.Mvvm.Input;

     public partial class DashboardViewModel : ObservableObject
     {
         [ObservableProperty]
         private string _statusMessage = "Ready";

         [ObservableProperty]
         private bool _isBusy;

         [RelayCommand]
         private async Task RefreshDataAsync()
         {
             IsBusy = true;
             StatusMessage = "Đang tải dữ liệu...";
             try
             {
                 await Task.Delay(1000); // Async operation
                 StatusMessage = "Hoàn tất";
             }
             finally
             {
                 IsBusy = false;
             }
         }
     }
     ```
2. **Nguyên Tắc "Không Đụng Code-Behind":**
   - File `MainWindow.xaml.cs` hoặc `MainWindow.axaml.cs` chỉ chứa logic khởi tạo View (`InitializeComponent()`).
   - Mọi logic nghiệp vụ, gọi API, thao tác dữ liệu phải nằm hoàn toàn trong ViewModel hoặc Services.

---

## 2. Decoupling UI Thread & Async IO
1. **Quy Tắc Vàng: Cấm Chặn UI Thread (Never Block the Main Thread):**
   - Mọi thao tác đọc/ghi file ổ cứng, gọi mạng HTTP, hoặc tính toán nặng **bắt buộc dùng `async/await`**.
   - Tuyệt đối cấm dùng `.Result` hoặc `.Wait()` trên Task vì sẽ gây Deadlock và đóng băng giao diện (Not Responding).
2. **Cập Nhật Giao Diện Từ Thread Phụ:**
   - Khi chạy tác vụ nền (Background Worker / Task.Run), nếu cần cập nhật UI phải gọi qua Dispatcher:
     ```csharp
     // Avalonia
     await Dispatcher.UIThread.InvokeAsync(() => StatusText = "Xong");

     // WPF
     Application.Current.Dispatcher.Invoke(() => StatusText = "Xong");
     ```

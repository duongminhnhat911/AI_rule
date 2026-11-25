# GOTCHAS, QUIRKS & LESSONS LEARNED
> **Mục tiêu:** Lưu trữ những "bẫy ngầm", kinh nghiệm xương máu và hành vi kỳ lạ của thư viện/công cụ trong dự án này để AI không giẫm lại vết xe đổ.

---

## ⚡ 1. Các "Bẫy Ngầm" Trong Mã Nguồn (Code Gotchas)
Ghi lại các hành vi kỳ quặc của code mà nhìn qua tưởng bình thường nhưng sửa vào là lỗi:
* **[Bẫy 1 - Ví dụ: Không dùng async trong Awake/Start của Unity]:**
  - *Mô tả:* Unity lifecycle không chờ `async Task Start()`. Nếu gọi async bừa bãi sẽ dẫn tới race condition khi các component khác truy cập data chưa kịp nạp.
  - *Giải pháp:* Dùng Coroutine hoặc UniTask với `await` có kiểm tra `destroyCancellationToken`.
* **[Bẫy 2 - Ví dụ: Serialization của Newtonsoft.Json vs System.Text.Json]:**
  - *Mô tả:* Backend đang dùng `Newtonsoft.Json` để serialize enum dạng String, trong khi Client dùng `System.Text.Json` mặc định đọc dạng Integer $\rightarrow$ Bị lỗi 400 Bad Request.
  - *Giải pháp:* Luôn đánh dấu `[JsonConverter(typeof(StringEnumConverter))]` trên DTO.

---

## 🔌 2. Giới Hạn Hạ Tầng & Dịch Vụ Ngoài (Infrastructure Quirks)
* **Rate Limits:** [Ví dụ: API gửi mail OTP giới hạn tối đa 3 request / phút / IP].
* **Thư viện bên thứ ba:** [Ví dụ: Thư viện X bản 2.1 bị memory leak nếu không gọi hàm Dispose() thủ công].
* **Đặc thù Hệ điều hành:** [Ví dụ: Đường dẫn file trên Windows dùng backslash `\` nhưng khi gửi lên web server phải đổi thành forward slash `/`].

---

## 💡 3. Các Giải Pháp Tạm Thời Đang Áp Dụng (Workarounds / Technical Debt)
* *Workaround 1:* [Ví dụ: Đang tạm thời bypass bước xác thực OTP email để test nhanh chức năng đăng ký].
* *Workaround 2:* [Ví dụ: Tạm thời hardcode hệ số tăng máu quái ở mức 30%/tầng thay vì 20% theo yêu cầu của Lead Game Designer].

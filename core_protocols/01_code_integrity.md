# CORE PROTOCOL 01: CODE INTEGRITY & CRAFTSMANSHIP
> **Mục tiêu:** Đảm bảo mã nguồn được sinh ra hoặc sửa đổi luôn đạt chuẩn chất lượng cao nhất, không bị ảo giác cú pháp, bảo toàn kiến trúc hiện hữu và dễ bảo trì.

---

## 1. Nguyên Tắc "Khảo Sát Trước Khi Hành Động" (Inspection First)
1. **Tuyệt đối không đoán mò cấu trúc file:**
   - Trước khi sửa bất kỳ file nào, AI **bắt buộc** phải đọc file (`read_file`, `grep`) để nắm rõ:
     - Cách đặt tên biến/hàm hiện tại.
     - Lối thụt lề (Indentation: 2 spaces, 4 spaces hay Tabs).
     - Quy cách ngắt dòng (CRLF hay LF).
2. **Không tự bịa đặt thư viện (Zero Hallucinated Dependencies):**
   - Không import các package, framework hoặc hàm chưa được cài đặt trong `package.json`, `requirements.txt`, `.csproj`, `Cargo.toml`, hay `pubspec.yaml`.
   - Khi cần dùng thư viện mới, phải kiểm tra xem project đã có sẵn giải pháp tương đương chưa.

---

## 2. Bảo Toàn Mã Nguồn Hiện Hữu (Preservation of Existing Context)
1. **Giữ nguyên Comments và Docstrings:**
   - Không tự ý xóa, tóm tắt hoặc viết lại các khối comment, docstring, XML docs hiện có trừ khi được người dùng yêu cầu trực tiếp hoặc comment đó đã hoàn toàn sai lệch do logic mới.
2. **Sửa đổi nguyên tử (Atomic & Minimal Diff):**
   - Chỉ sửa đúng khu vực liên quan đến lỗi hoặc tính năng cần thêm.
   - Không tự tiện "tiện tay refactor" toàn bộ file gây ra diff khổng lồ, làm khó cho việc code review và merge nhánh Git.
3. **Tuân thủ quy chuẩn Format của Project:**
   - Nếu dự án dùng Prettier, ESLint, CSharpier, Black hay Rustfmt, code sinh ra phải tuân thủ đúng quy chuẩn đó.

---

## 3. Kiến Trúc Sạch & Thiết Kế Bền Vững (Clean Architecture)
1. **Tách biệt mối quan tâm (Separation of Concerns):**
   - **Data/Model:** Chỉ chứa dữ liệu và validation cơ bản.
   - **Business Logic / Service:** Xử lý nghiệp vụ, độc lập với UI và Database.
   - **UI / Presentation:** Chỉ nhận dữ liệu và hiển thị, không nhồi logic tính toán phức tạp vào hàm render.
2. **Nguyên tắc SOLID:**
   - Ưu tiên Single Responsibility (Mỗi hàm/class chỉ làm 1 việc duy nhất).
   - Tránh "God Class" hoặc hàm dài quá 80 dòng. Nếu hàm quá dài, bắt buộc tách thành các hàm con private có tên tự giải thích (self-explanatory).
3. **Xử lý ngoại lệ chặt chẽ (Error Handling):**
   - Tuyệt đối không dùng `catch (Exception) {}` rỗng để nuốt lỗi (silent fail).
   - Mọi exception phải được log rõ ràng hoặc ném ra custom exception có ý nghĩa nghiệp vụ.

---

## 4. Cổng Phản Biện & Làm Rõ Góc Khuất (Clarification Gate)
1. **Chặn đứng suy diễn chủ quan (No Blind Assumptions):**
   - Với tính năng mới hoặc nghiệp vụ phức tạp có nhiều ngã rẽ logic, AI **bắt buộc phải dừng lại 1 nhịp** để đưa ra 2-3 câu hỏi phản biện ngắn gọn về các trường hợp biên (Edge Cases, Race Conditions, Rollback khi lỗi) và chờ User chốt phương án trước khi sinh code.
2. **Quy tắc phân biệt việc lớn và việc nhỏ (Pragmatic / Non-blocking):**
   - **Tác vụ nhỏ & rõ ràng** (fix bug nhỏ, đổi màu/vị trí UI, thêm field đơn giản, sửa typo): AI **thực thi ngay lập tức**, tuyệt đối KHÔNG hỏi rườm rà làm gián đoạn dòng suy nghĩ của User.
   - **Tác vụ lớn / nhiều rủi ro** (thanh toán, cơ chế combat, phân quyền, luồng dữ liệu phân tán): Bắt buộc kích hoạt Clarification Gate để chốt đúng phương án A/B/C trước khi lập Task.

---

## 5. Quy Trình Đúc Rút Bài Học & Phòng Thủ Lỗi Cũ (Lesson Learned Protocol)
1. **Kích hoạt khi User yêu cầu:**
   - Khi User ra lệnh: *"Rút kinh nghiệm lỗi này"*, *"Đúc kết bài học"*, hoặc *"Lưu gotcha lại"*, AI **bắt buộc phải format theo mẫu [`templates/Lesson_Learned_template.md`](../templates/Lesson_Learned_template.md)** gồm 3 phần:
     - **Nguyên nhân gốc rễ (Root Cause Analysis):** Tại sao lỗi xuất hiện?
     - **❌ Anti-Pattern:** Đoạn code/hành vi sai lầm đã gây ra lỗi.
     - **✅ Defensive Pattern:** Đoạn code phòng thủ chuẩn xác đã được kiểm chứng.
2. **Quy tắc phân luồng lưu trữ (Local vs Global):**
   - **Lỗi đặc thù cục bộ** (xung đột version thư viện cụ thể, cấu hình port, logic riêng của dự án này) $\rightarrow$ Ghi ngay vào [**`project_context/04_gotchas_and_quirks.md`**](../project_context/04_gotchas_and_quirks.md).
   - **Lỗi logic phổ quát hoặc lỗ hổng bảo mật** (Race condition tiền tệ, IDOR, SQL injection, memory leak, floating point error) $\rightarrow$ Đề xuất User cập nhật trực tiếp vào file [**`domain_standards/`**](../domain_standards/) tương ứng để **mọi dự án sau này đều tự động được bảo vệ**.

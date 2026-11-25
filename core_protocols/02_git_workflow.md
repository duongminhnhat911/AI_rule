# CORE PROTOCOL 02: GIT DISCIPLINE & WORKFLOW
> **Mục tiêu:** Kiểm soát an toàn phiên bản, chống mất mát mã nguồn, chống xung đột nhánh và tuân thủ kỷ luật commit của nhóm phát triển.

---

## 1. Kỷ Luật Commit & Nhánh (Branching Discipline)
1. **Quy chuẩn tên commit (Conventional Commits):**
   Mọi commit message phải viết bằng Tiếng Anh súc tích, theo chuẩn:
   - `feat(<scope>): [Mô tả ngắn gọn tính năng mới]` (Ví dụ: `feat(auth): add JWT refresh token rotation`)
   - `fix(<scope>): [Mô tả lỗi vừa sửa]` (Ví dụ: `fix(player): resolve NullReferenceException on respawn`)
   - `refactor(<scope>): [Tối ưu code không đổi logic]` (Ví dụ: `refactor(db): optimize user query execution`)
   - `perf(<scope>): [Cải thiện hiệu năng / memory]`
   - `test(<scope>): [Bổ sung unit test hoặc mock]`
   - `docs(<scope>): [Cập nhật tài liệu, ADR, diagram]`
2. **Quy tắc làm việc trên nhánh:**
   - Xác định rõ nhánh làm việc được chỉ định (Ví dụ nhánh cá nhân `feature/<name>` hoặc nhánh dev riêng).
   - Nếu nhánh hiện tại không trùng khớp với yêu cầu của User, **phải thông báo cho User biết trước khi sửa file**.
3. **Đồng bộ trước khi đẩy (Pull before Push):**
   - Trước khi có ý định kết thúc hoặc bàn giao, luôn phải kiểm tra việc đồng bộ nhánh chính (vd: `git pull origin dev` hoặc `main`) để xử lý conflict cục bộ trên máy trước.

---

## 2. Các Ranh Giới Đỏ Bắt Buộc (The Red Lines)
1. **CHỈ COMMIT KHI USER YÊU CẦU:**
   - AI **tuyệt đối không tự ý chạy `git commit`** sau mỗi tác vụ sửa code.
   - Chỉ thực hiện commit khi người dùng nói rõ: *"Commit đi em"*, *"Tạo commit cho anh"*, v.v.
2. **TUYỆT ĐỐI KHÔNG TỰ Ý `git push`:**
   - Mọi thao tác push mã nguồn lên remote repository (GitHub, GitLab, Bitbucket) bắt buộc phải có sự xác nhận của người dùng.
3. **CẤM CHẠY `git status` BỪA BÃI:**
   - Trừ khi người dùng hỏi hoặc cần kiểm tra diff thực tế, không tự động spam lệnh `git status` làm loãng cửa sổ console và tốn token ngữ cảnh.
4. **CẤM SỬ DỤNG CÁC LỆNH HỦY DIỆT:**
   - Tuyệt đối cấm chạy: `git reset --hard`, `git clean -fd`, `git checkout .`, `git push --force` mà không có lệnh trực tiếp và cảnh báo rõ ràng mức độ rủi ro cho người dùng.

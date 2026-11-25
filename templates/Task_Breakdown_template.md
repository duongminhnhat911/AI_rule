# Task Execution Breakdown: [Tên Tính Năng / Nhiệm Vụ Lớn]
> **Quy tắc thực thi:** Chia để trị (Divide & Conquer). Thực hiện tuần tự từng task nguyên tử (Atomic Task). Hoàn thành và kiểm chứng xong Task trước mới chuyển sang Task sau.

---

## 🎯 1. Mục Tiêu & Các Điểm Đã Chốt (Clarified Decisions)
* **Tính năng:** [Tên tính năng hoặc mã UC liên quan]
* **Các điểm mép đã chốt qua Clarification Gate:**
  1. *Quyết định 1:* [Ví dụ: Balo đầy thì chặn mua, không trừ Gem]
  2. *Quyết định 2:* [Ví dụ: Áp dụng Idempotency Key để chống spam double-click]

---

## 📋 2. Danh Sách Tác Vụ Tuần Tự (Task Execution Checklist)

- [ ] **Task 1: [Tên bước 1 - Thường là Model / Entity / DB Migration]**
  - **Mục tiêu:** [Mô tả ngắn gọn việc cần làm]
  - **Files tác động:** `[path/to/file1]`, `[path/to/file2]`
  - **🧪 Tiêu chí kiểm chứng (Pass Criteria):** [Ví dụ: Chạy migration thành công, không lỗi schema]

- [ ] **Task 2: [Tên bước 2 - Thường là Service / Business Logic]**
  - **Mục tiêu:** [Xử lý logic tính toán, bọc transaction, validation]
  - **Files tác động:** `[path/to/service.cs]`
  - **🧪 Tiêu chí kiểm chứng (Pass Criteria):** [Ví dụ: Unit test chạy xanh 100%, test case boundary pass]

- [ ] **Task 3: [Tên bước 3 - Thường là API Controller / Network Hub]**
  - **Mục tiêu:** [Expose endpoint, gắn attribute authorize, mapping DTO]
  - **Files tác động:** `[path/to/controller.cs]`
  - **🧪 Tiêu chí kiểm chứng (Pass Criteria):** [Ví dụ: Gọi thử endpoint trả về đúng HTTP 200/201/400]

- [ ] **Task 4: [Tên bước 4 - Thường là UI / Client Integration]**
  - **Mục tiêu:** [Gắn sự kiện nút bấm, hiển thị loading, cập nhật state giao diện]
  - **Files tác động:** `[path/to/ui_component]`
  - **🧪 Tiêu chí kiểm chứng (Pass Criteria):** [Ví dụ: Bấm nút giao diện phản hồi mượt, hiển thị đúng dữ liệu]

---

## 📌 3. Nhật Ký Tiến Độ Thực Tế (Execution Status)
* **Task đang thực hiện:** [Ví dụ: Đang làm Task 2]
* **Ghi chú kỹ thuật phát sinh:** [Ví dụ: Cần bổ sung thêm 1 enum Status vào DTO]

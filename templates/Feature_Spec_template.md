# Feature Specification Document: [Tên Tính Năng]

## 1. Mục Tiêu Nghiệp Vụ (Business Goal)
- Mô tả mục tiêu của tính năng: Giải quyết vấn đề gì cho người dùng hoặc hệ thống?
- Giá trị mang lại và tiêu chí thành công (Definition of Done).

---

## 2. Các Quy Định Nghiệp Vụ (Business Rules - BR)
| Mã BR | Tên Quy Định | Chi Tiết Logic & Ràng Buộc |
| :--- | :--- | :--- |
| **BR-01** | [Quy định 1] | [Mô tả công thức tính toán, điều kiện kiểm tra, hạn mức] |
| **BR-02** | [Quy định 2] | [Mô tả hành vi khi người dùng không đủ quyền hoặc số dư] |

---

## 3. Các Ca Sử Dụng (Use Cases - UC)
### UC-01: [Tên Ca Sử Dụng 1]
* **Actor:** [Người dùng / Admin / Hệ thống tự động]
* **Pre-conditions (Điều kiện tiên quyết):** [Ví dụ: Đã đăng nhập, session hợp lệ]
* **Main Flow (Luồng chính):**
  1. Người dùng bấm vào nút...
  2. Hệ thống kiểm tra điều kiện...
  3. Hệ thống trả về kết quả...
* **Alternative / Error Flow (Luồng phụ / Xử lý lỗi):**
  - Nếu dữ liệu sai: Trả về thông báo lỗi cụ thể...
* **Post-conditions (Kết quả sau khi thực hiện):** [Ví dụ: Dữ liệu được lưu vào DB, email xác nhận được gửi]

---

## 4. Đặc Tả Dữ Liệu & API Contract
- **Endpoint:** `POST /api/v1/[resource]`
- **Request Body (JSON):**
  ```json
  {
    "field": "value"
  }
  ```
- **Response 200 OK:**
  ```json
  {
    "success": true,
    "data": {}
  }
  ```

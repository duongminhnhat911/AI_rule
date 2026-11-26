# UI/UX Pro Max Skill — Offline Design System & Aesthetics Intelligence
> **Mục tiêu:** Cung cấp hệ thống tra cứu Design System, bảng màu, typography, chuyển động (motion), và UX guidelines chạy 100% offline (0 token, dùng thuật toán BM25 trên Python chuẩn) cho mọi nền tảng: **Web, Mobile, Desktop App, Game UI**.

---

## 🎯 Khi Nào AI Kích Hoạt Skill Này?
Tự động kích hoạt khi User yêu cầu:
- Thiết kế trang mới, Dashboard, Landing Page, Mobile Screen, Desktop Window.
- Chọn bảng màu (Color Palette), cặp font chữ (Typography Pairing), phong cách UI (Glassmorphism, Minimalist, Bento Grid, Dark Mode...).
- Review hoặc tối ưu UX, Accessibility (a11y), hiệu năng render UI cho một stack cụ thể.

---

## 🛠️ Cách Thực Thi (Zero-Token Offline Search)
*Không đọc trực tiếp toàn bộ file CSV để tiết kiệm token.* Hãy chạy script `search.py` bằng Python (dùng `python`, `py`, hoặc `python3` tùy hệ điều hành):

### 1. Sinh Design System tổng thể (Khuyên dùng đầu tiên)
```powershell
python skills/ui-ux-pro-max/scripts/search.py "<loại sản phẩm> <phong cách> <từ khóa>" --design-system -p "<Tên Dự Án>"
```
*Ví dụ:*
```powershell
python skills/ui-ux-pro-max/scripts/search.py "saas analytics dashboard dark mode" --design-system -p "AdminPortal"
```

### 2. Tra cứu chuyên sâu theo Domain cụ thể
```powershell
python skills/ui-ux-pro-max/scripts/search.py "<từ khóa>" --domain <style|color|typography|ux|chart|landing|icons|gsap>
```

### 3. Tra cứu Best Practices theo Stack kỹ thuật
```powershell
python skills/ui-ux-pro-max/scripts/search.py "<từ khóa>" --stack <react|nextjs|html-tailwind|shadcn|vue|svelte|flutter|react-native|swiftui|jetpack-compose|avalonia|wpf|winui|threejs>
```

---

## 📁 Cấu Trúc Lõi
* `scripts/core.py` — Động cơ tìm kiếm BM25 thuần Python (0 external dependencies).
* `scripts/design_system.py` — Bộ tổng hợp Design System + anti-patterns từ `ui-reasoning.csv`.
* `scripts/search.py` — CLI entry point.
* `data/*.csv` & `data/stacks/*.csv` — Cơ sở dữ liệu thiết kế & best practices cho hơn 20 stack.

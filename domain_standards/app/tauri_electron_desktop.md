# DOMAIN STANDARD: DESKTOP APPS — TAURI & ELECTRON
> **Mục tiêu:** Tiêu chuẩn phát triển phần mềm máy tính (Desktop App) với Tauri 2.0 (Rust) và Electron (Node.js), tối ưu hóa RAM, IPC an toàn và giao diện Native.

---

## 1. Tauri (Rust + Web Frontend) — Lựa Chọn Tối Ưu RAM
1. **Kiến Trúc IPC (Inter-Process Communication):**
   - Sử dụng lệnh `invoke` an toàn:
     ```rust
     // src-tauri/src/main.rs
     #[tauri::command]
     fn read_local_config(file_name: String) -> Result<String, String> {
         // Rust code xử lý file an toàn
     }
     ```
     ```typescript
     // Frontend call
     import { invoke } from "@tauri-apps/api/core";
     const config = await invoke<string>("read_local_config", { fileName: "app.json" });
     ```
2. **Nguyên tắc An Toàn Tauri Capabilities:**
   - Chỉ cấp quyền tối thiểu trong `tauri.conf.json` (Scoped permissions: fs, dialog, shell).
   - Không cho phép frontend gọi shell command tùy tiện nếu chưa được whitelist cụ thể.

---

## 2. Electron — Khi Cần Hệ Sinh Thái Node.js Sâu
1. **Bảo Mật Bắt Buộc Trong Electron (Security Checklist):**
   - Luôn bật `contextIsolation: true`.
   - Luôn tắt `nodeIntegration: false` ở Renderer Process.
   - Sử dụng `preload.js` kết hợp với `contextBridge.exposeInMainWorld` để chỉ mở các hàm API cụ thể cho UI.
2. **Tối Ưu Bộ Nhớ (RAM Footprint):**
   - Hủy bỏ các event listener khi unmount window.
   - Không giữ các tham chiếu biến toàn cục ở Main Process gây memory leak.

---

## 3. Tích Hợp Native OS (Window Framing & Tray)
1. **Frameless Windows & Custom Titlebar:**
   - Khi làm giao diện không viền (Frameless), phải chỉ định rõ vùng kéo thả cửa sổ:
     ```html
     <div style="-webkit-app-region: drag;" class="h-8 w-full bg-slate-900">
       <!-- Nút bấm phải có no-drag để click được -->
       <button style="-webkit-app-region: no-drag;">✕</button>
     </div>
     ```
2. **System Tray & Thu nhỏ về Khay hệ thống:**
   - Nhấn nút Close (`✕`) nên có tùy chọn: Ẩn vào khay hệ thống (Tray) thay vì tắt hẳn nếu app có tính năng chạy ngầm hoặc thông báo.

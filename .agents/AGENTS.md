# UNIVERSAL AI AGENT GOVERNANCE & PROTOCOLS (MASTER DISPATCHER)
> **Phạm vi:** Áp dụng cho mọi AI Coding Agent (Google Antigravity, Claude Code, Cursor, Copilot, Codex, Windsurf, RooCode).
> **Thư mục quy chuẩn:** `scripted_AI/`

---

## 🧠 0. BỘ NHỚ & BỐI CẢNH SỐNG CỦA DỰ ÁN (PROJECT CONTEXT & LIVING MEMORY)
Trước khi bắt tay vào phân tích, gợi ý hay sửa code, AI **BẮT BUỘC phải đọc lướt qua thư mục [`project_context/`](../project_context/)** để nạp bối cảnh riêng của dự án hiện tại:

1. **[01_project_overview.md](../project_context/01_project_overview.md):** Nắm rõ Tech Stack, ports, test accounts và đặc biệt là **"Vùng cấm địa"** không được tự tiện sửa.
2. **[02_business_rules.md](../project_context/02_business_rules.md):** Đối chiếu các quy định nghiệp vụ cốt lõi (**BR-01, BR-02...**) và danh sách Use Cases (**UC-01, UC-02...**).
3. **[03_handover_notes.md](../project_context/03_handover_notes.md):** Nắm rõ trạng thái phiên làm việc trước: Việc gì vừa xong? Việc gì đang dở dang? **Việc ưu tiên số 1 cần làm ngay là gì?**
4. **[04_gotchas_and_quirks.md](../project_context/04_gotchas_and_quirks.md):** Đọc kỹ các "bẫy ngầm", kinh nghiệm xương máu và lỗi thư viện đặc thù của dự án để không giẫm lại vết xe đổ.

---

## ⚖️ 1. NGUYÊN TẮC HÀNH VI TỐI CAO (CORE PROTOCOLS)
Mọi Agent khi làm việc trong dự án này **bắt buộc phải tuân thủ nghiêm ngặt 5 bộ luật cốt lõi** trong thư mục [`core_protocols/`](../core_protocols/):

1. **[Code Integrity & Craftsmanship](../core_protocols/01_code_integrity.md):**
   - **Khảo sát trước khi sửa:** Luôn đọc file trước khi viết code; tuyệt đối không đoán mò cú pháp.
   - **Clarification Gate:** Dừng lại hỏi 2-3 câu làm rõ mép logic (Edge Cases) với tính năng phức tạp trước khi code; tác vụ nhỏ thực thi ngay.
   - **Lesson Extraction:** Khi User yêu cầu rút kinh nghiệm, format theo Root Cause $\rightarrow$ ❌ Anti-Pattern $\rightarrow$ ✅ Defensive Pattern để nạp vào `04_gotchas_and_quirks.md` hoặc `domain_standards/`.
   - **Bảo tồn ngữ cảnh:** Giữ nguyên comments, docstrings, không tự tiện refactor các file không liên quan.
   - **Không ảo giác dependency:** Chỉ dùng thư viện đã có trong file cấu hình dự án.
2. **[Git Discipline & Workflow](../core_protocols/02_git_workflow.md):**
   - **CHỈ COMMIT KHI USER YÊU CẦU:** Tuyệt đối không tự ý commit hay push code lên Git.
   - **Quy chuẩn commit:** Conventional Commits bằng Tiếng Anh (`feat:`, `fix:`, `refactor:`, `perf:`).
   - **Cấm lệnh hủy diệt:** Không chạy `git reset --hard`, `git checkout .`, `git clean -fd`.
   - **Không spam:** Tuyệt đối KHÔNG chạy `git status` bừa bãi.
3. **[Empirical Verification & Testing](../core_protocols/03_testing_verification.md):**
   - **Chứng minh bằng thực nghiệm:** Bắt buộc chạy kiểm tra biên dịch hoặc test ngầm và in log kết quả ra terminal trước khi thông báo hoàn thành nhiệm vụ.
4. **[Safety Guardrails](../core_protocols/04_safety_guardrails.md):**
   - Tuyệt đối cấm các lệnh xóa CSDL nguy hiểm (`DROP`, `TRUNCATE`).
   - Cấm hardcode API keys, secrets, mật khẩu.
5. **[Context Management & Logging Rules](../core_protocols/05_context_management.md):**
   - **CHỈ CẬP NHẬT NHẬT KÝ KHI ĐƯỢC YÊU CẦU:** Không tự ý sửa báo cáo tiến độ hay work logs sau mỗi tác vụ.
   - Luôn đọc lại bối cảnh trong `scripted_AI/` trước khi bắt đầu phiên làm việc.

---

## 🧭 2. BỘ ĐIỀU HƯỚNG CHUYÊN MÔN THEO LĨNH VỰC (DOMAIN ROUTER)
Tùy thuộc vào phần mềm đang làm việc, AI tự động kích hoạt bộ tiêu chuẩn kỹ thuật chuyên sâu tương ứng:

### 🎮 A. Dự Án Game (Game Development)
*Kích hoạt khi làm việc với Unity, Unreal Engine, Godot, C#, C++:*
* **[Unity C# Standards](../domain_standards/game/unity_csharp_standards.md):**
  - **100% Tiếng Anh (English Only)** cho toàn bộ code, UI, comment, string, log trong game Unity.
  - Zero GC trong `Update()`: Cấm `GetComponent`, cấm `new`, cấm LINQ, bắt buộc dùng `ObjectPool`.
  - Component Isolation: Tách biệt input giữa Local Player và Remote Player.
* **[Unreal C++ Standards](../domain_standards/game/unreal_engine_cpp.md):**
  - Quản lý UObject an toàn qua `UPROPERTY()`, macro naming conventions, GAS integration.
* **[Game Performance & Physics](../domain_standards/game/game_performance_physics.md):**
  - Tối ưu Draw calls, Collision matrix, Async Addressables loading.

### 🌐 B. Dự Án Web (Web Development)
*Kích hoạt khi làm việc với React, Next.js, Node.js, .NET Backend, Go, Python API:*
* **[React & Next.js Frontend](../domain_standards/web/react_next_frontend.md):**
  - Server Components vs Client Components, Zustand / TanStack Query, TailwindCSS clean rules.
* **[Backend & Clean Architecture](../domain_standards/web/backend_api_architecture.md):**
  - Chuẩn RESTful API status codes, Clean Architecture (Domain, Application, Infrastructure), ACID Transactions.
* **[Web Security OWASP](../domain_standards/web/web_security_owasp.md):**
  - Chống SQLi bằng Parameterized Query, JWT Access/Refresh rotation, CORS và CSP headers.

### 🖥️ C. Dự Án Desktop App (Desktop & System Software)
*Kích hoạt khi làm việc với Tauri, Electron, .NET Avalonia, WPF, Python Desktop:*
* **[Tauri & Electron Standards](../domain_standards/app/tauri_electron_desktop.md):**
  - IPC commands an toàn, Frameless custom titlebar, System Tray integration.
* **[.NET Desktop MVVM](../domain_standards/app/dotnet_desktop_wpf_avalonia.md):**
  - CommunityToolkit.Mvvm, Zero blocking UI Thread, Async/Await IO.
* **[System App Resilience](../domain_standards/app/system_app_resilience.md):**
  - Single Instance Mutex, Global Hotkey cleanup, Unhandled Exception logging.

### 📱 D. Dự Án Mobile (Mobile App Development)
*Kích hoạt khi làm việc với Flutter, React Native, iOS, Android:*
* **[Flutter & Dart Standards](../domain_standards/mobile/flutter_dart_standards.md):**
  - Sound Null Safety, Bloc/Riverpod architecture, `const` widgets, `ListView.builder`.
* **[React Native Expo](../domain_standards/mobile/react_native_standards.md):**
  - Expo Router, Reanimated 3 UI-thread worklets, `@shopify/flash-list`.
* **[Mobile Resilience & UX](../domain_standards/mobile/mobile_resilience_ux.md):**
  - Offline-first SQLite synchronization, tiết kiệm Pin & GPS, Just-in-time permissions.

---

## 📌 3. QUY ĐỊNH ĐẶC THÙ CỦA DỰ ÁN (PROJECT-SPECIFIC OVERRIDES)
*(Tùy chỉnh riêng cho từng dự án khi cài đặt framework này vào workspace mới)*
1. **Ngôn ngữ mã nguồn & UI:** [Ví dụ: 100% Tiếng Anh cho code/UI, Tiếng Việt cho báo cáo]
2. **Nhánh Git làm việc:** [Ví dụ: Làm việc trên nhánh `feature/main-dev`, đồng bộ từ `origin/dev`]
3. **Ràng buộc công nghệ đặc biệt:** [Ví dụ: Không thay đổi thư viện Networking/ORM hiện có]

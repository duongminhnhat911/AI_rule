# 🌸 Scripted_AI (v2.0) — Universal AI Engineering Framework
> **Bộ Quy Chuẩn & Hệ Thống Quản Trị Tác Vụ Toàn Năng Dành Cho Mọi AI Coding Agent**  
> *Hỗ trợ chuyên sâu 4 trụ cột kỹ thuật: **Game**, **Web**, **Desktop App**, và **Mobile App**.*

---

## 🌟 1. Tổng Quan & Triết Lý Kiến Trúc

`scripted_AI` không phải là một mô hình AI đơn lẻ, mà là một **"Hệ thống Quản trị & Bối cảnh Tri thức Toàn Năng" (Universal Context & Governance Framework)** được thiết kế để đặt vào thư mục gốc của bất kỳ dự án phần mềm nào.

Nó giải quyết triệt để vấn đề: **Làm sao để bất kỳ con AI nào (Google Antigravity, Claude Code, Cursor, Copilot, Codex) khi bước vào dự án của bạn đều lập tức hiểu sâu kiến trúc, tuân thủ kỷ luật làm việc khắt khe và lập trình với trình độ của một Senior Tech Lead?**

```text
                                  ┌──────────────────────────────┐
                                  │   AI CODING AGENTS           │
                                  │   (Antigravity, Claude,      │
                                  │    Cursor, Codex, Windsurf)  │
                                  └──────────────┬───────────────┘
                                                 │
                        ┌────────────────────────┼────────────────────────┐
                        ▼                        ▼                        ▼
        ┌───────────────────────────────┐┌───────────────────────────────┐┌───────────────────────────────┐
        │       TẦNG 1: LUẬT THÉP       ││       TẦNG 2: CHUYÊN MÔN      ││      TẦNG 3: BỘ NHỚ DỰ ÁN     │
        │       (CORE PROTOCOLS)        ││       (DOMAIN STANDARDS)      ││       (PROJECT CONTEXT)       │
        ├───────────────────────────────┤├───────────────────────────────┤├───────────────────────────────┤
        │ • 01. Code Integrity (Khảo sát)││ 🎮 Game: Unity C# / Unreal C++││ • 01. Overview & Vùng cấm địa │
        │ • 02. Git Discipline (An toàn)││ 🌐 Web: React, Next, Clean API││ • 02. Business Rules (BR)    │
        │ • 03. Testing Proof (Kiểm thử)││ 🖥️ App: Tauri, Electron, .NET ││ • 03. Handover Notes (Bàn giao)│
        │ • 04. Safety Guardrails (Cấm) ││ 📱 Mobile: Flutter, React Nat ││ • 04. Gotchas & Lessons Learned│
        │ • 05. Context & No Spam Logs  ││ 🎨 UI/UX: ui-ux-pro-max-skill ││ • Architecture Decisions (ADR)│
        └───────────────────────────────┘└───────────────────────────────┘└───────────────────────────────┘
                                                 │
                                                 ▼
                                  ┌──────────────────────────────┐
                                  │    DỰ ÁN PHẦN MỀM CỦA BẠN    │
                                  │   (Clean, Fast, Zero Bugs)   │
                                  └──────────────────────────────┘
```

---

## 📁 2. Cấu Trúc Thư Mục Chuẩn Hóa

```text
scripted_AI/
├── README.md                      # Tài liệu tổng quan này
├── setup_project_rules.ps1        # Script 1-click cài đặt Scripted_AI sang dự án mới
│
├── .agents/                       # Cổng kết nối chuẩn Antigravity
│   └── AGENTS.md                  # Master Dispatcher nạp luật, bối cảnh và định tuyến lĩnh vực
├── CLAUDE.md                      # Cổng kết nối chuẩn Claude Code (Anthropic)
├── .cursorrules                   # Cổng kết nối chuẩn Cursor IDE & Windsurf
│
├── project_context/               # 🧠 BỘ NHỚ & BỐI CẢNH SỐNG CỦA RIÊNG DỰ ÁN NÀY
│   ├── 01_project_overview.md     # Tech Stack, ports, test accounts và VÙNG CẤM ĐỊA không được sửa
│   ├── 02_business_rules.md       # Bảng quy định nghiệp vụ cốt lõi (BR-01, BR-02...) và Use Cases (UC)
│   ├── 03_handover_notes.md       # Bàn giao ca làm việc: Việc vừa xong, việc dở dang, việc ưu tiên số 1
│   └── 04_gotchas_and_quirks.md   # Các "bẫy ngầm", lỗi thư viện và kinh nghiệm xương máu của dự án
│
├── core_protocols/                # ⚖️ 5 BỘ LUẬT CỐT LÕI (BẮT BUỘC ÁP DỤNG MỌI DỰ ÁN)
│   ├── 01_code_integrity.md       # Khảo sát trước khi sửa, bảo tồn comments, zero dependency ảo giác
│   ├── 02_git_workflow.md         # Kỷ luật commit, cấm tự ý push, cấm chạy git status bừa bãi
│   ├── 03_testing_verification.md # Bắt buộc kiểm chứng ngầm, in log chứng minh trước khi hoàn thành
│   ├── 04_safety_guardrails.md    # Cấm xóa CSDL, cấm lệnh phá hoại, bảo vệ API keys
│   └── 05_context_management.md  # Chỉ cập nhật nhật ký khi được yêu cầu, đọc bối cảnh trước khi code
│
├── domain_standards/              # 🧭 BỘ TIÊU CHUẨN KỸ THUẬT THEO 4 LĨNH VỰC CHUYÊN SÂU
│   ├── game/                      # 🎮 LẬP TRÌNH GAME
│   │   ├── unity_csharp_standards.md   # Unity 6 C# 12, English only, Zero GC in Update, Object pooling
│   │   ├── unreal_engine_cpp.md        # Unreal Engine 5 C++, UObject memory safety, GAS, C++ vs BP
│   │   └── game_performance_physics.md # Draw calls, Collision matrix, Async Addressables
│   │
│   ├── web/                       # 🌐 LẬP TRÌNH WEB
│   │   ├── react_next_frontend.md      # React 19, Next.js App Router, Tailwind clean rules, Zustand
│   │   ├── backend_api_architecture.md # RESTful status codes, Clean Architecture, ACID transactions
│   │   └── web_security_owasp.md       # Chống SQL Injection, JWT refresh rotation, CORS, XSS
│   │
│   ├── app/                       # 🖥️ LẬP TRÌNH DESKTOP / SYSTEM APP
│   │   ├── tauri_electron_desktop.md   # Tauri 2.0 (Rust) vs Electron, IPC commands, Custom Frameless
│   │   ├── dotnet_desktop_wpf_avalonia.md # .NET 8/9, Avalonia UI, WPF, CommunityToolkit.Mvvm, Async IO
│   │   └── system_app_resilience.md    # Single Instance Mutex, Global Hotkeys, Crash recovery
│   │
│   └── mobile/                    # 📱 LẬP TRÌNH MOBILE
│       ├── flutter_dart_standards.md   # Flutter 3, Sound Null Safety, Bloc/Riverpod, const widgets
│       ├── react_native_standards.md   # React Native Expo Router, Reanimated 3 worklets, FlashList
│       └── mobile_resilience_ux.md     # Offline-first SQLite sync, tiết kiệm Pin/GPS, Just-in-time permissions
│
├── skills/                        # 🎨 THƯ MỤC CHỨA CÁC GÓI KỸ NĂNG CHUYÊN SÂU MỞ RỘNG (SKILL PACKS)
│   ├── README.md                  # Hướng dẫn cắm thêm các skill mở rộng (DevOps, Security, DB...)
│   └── ui-ux-pro-max/             # Lõi UI/UX Pro Max (BM25 offline search, 0 dependency, 20+ stack CSV)
│       ├── SKILL.md               # Chỉ thị kích hoạt cho AI
│       ├── scripts/               # core.py, design_system.py, search.py
│       └── data/                  # Bảng màu, typography, motion, UX guidelines, stacks/*.csv
│
└── templates/                     # 📝 CÁC MẪU VĂN BẢN QUẢN TRỊ DỰ ÁN
    ├── ADR-template.md            # Architecture Decision Record mẫu
    ├── PR_template.md             # Mô tả Pull Request chuẩn mực kèm checklist kiểm thử
    ├── Feature_Spec_template.md   # Đặc tả tính năng: Business Rules (BR) và Use Cases (UC)
    ├── Task_Breakdown_template.md # Phân rã nhiệm vụ tuần tự (Atomic Tasks) có tiêu chí pass từng bước
    ├── Lesson_Learned_template.md # Mẫu đúc rút bài học kinh nghiệm (Root Cause -> Anti-Pattern -> Defensive Fix)
    └── AI-Log-Template.md         # Mẫu nhật ký báo cáo công việc khi được User yêu cầu
```

---

## 🚀 3. Cách Tích Hợp Vào Bất Kỳ Dự Án Nào Chỉ Trong 5 Giây

Khi bạn bắt đầu một dự án mới (bất kể là Game Unity, Web Next.js, Desktop App Tauri hay Mobile Flutter), bạn chỉ cần mở PowerShell và chạy script:

```powershell
# Cài đặt toàn bộ bộ quy chuẩn vào dự án Web mới
.\setup_project_rules.ps1 -TargetDir "D:\Projects\MyNewWebApp" -Domain "web"

# Cài đặt chuyên sâu cho dự án Game Unity
.\setup_project_rules.ps1 -TargetDir "D:\Projects\MyUnityGame" -Domain "game"

# Cài đặt chuyên sâu cho dự án Mobile Flutter
.\setup_project_rules.ps1 -TargetDir "D:\Projects\MyMobileApp" -Domain "mobile"

# Hoặc cài đặt toàn năng tất cả lĩnh vực
.\setup_project_rules.ps1 -TargetDir "D:\Projects\MyMultiStackProject" -Domain "all"
```

---

## 🤖 4. Khả Năng Tương Thích Với Các AI Coding Agent

| AI Tool / IDE | Cách AI Tự Động Nhận Diện & Tuân Thủ |
| :--- | :--- |
| **Google Antigravity** | Tự động đọc [`.agents/AGENTS.md`](./.agents/AGENTS.md), nạp bối cảnh từ [`project_context/`](./project_context/) và kích hoạt Domain Router tương ứng với stack của bạn. |
| **Claude Code (Anthropic)** | Tự động đọc file [`CLAUDE.md`](./CLAUDE.md) tại thư mục gốc, nạp bối cảnh và kích hoạt các luật cấm commit tự ý, bắt buộc kiểm chứng test. |
| **Cursor IDE / Windsurf** | Tự động đọc file [`.cursorrules`](./.cursorrules) để tinh chỉnh gợi ý code và prompt agent. |
| **Custom Local Agents** | Tự động phát hiện thư mục `scripted_AI` và nạp vào bối cảnh ReAct Loop. |

# CLAUDE.md — Claude Code Guidelines & Behavioral Rules
> **Reference:** This project follows the Universal Scripted_AI Governance System located in `scripted_AI/`.

## 🧠 0. Mandatory Project Context Ingestion
- **Before writing code or answering complex questions**, ALWAYS inspect files in `scripted_AI/project_context/`:
  - `01_project_overview.md`: Check tech stack, ports, test accounts, and **Do Not Touch Zones**.
  - `02_business_rules.md`: Check Business Rules (BR) and Use Cases (UC).
  - `03_handover_notes.md`: Check what was done in the last session, blockers, and **top priority next actions**.
  - `04_gotchas_and_quirks.md`: Check known quirks, traps, and workarounds.

## ⚖️ 1. Prime Directives
1. **Always Inspect First:** Read relevant files completely before making edits. Never guess function signatures, imports, or file structures.
2. **Empirical Proof:** Run compile check or unit tests before completing tasks. Show verification log evidence in the terminal.
3. **Preserve Existing Code:** Keep all existing comments, docstrings, and formatting intact. Do not perform gratuitous refactoring.
4. **Clarification Gate:** Pause and ask 2-3 edge-case questions for complex features before writing code. Small tasks execute immediately.
5. **Lesson Extraction:** When prompted to save lessons, format as Root Cause $\rightarrow$ ❌ Anti-Pattern $\rightarrow$ ✅ Defensive Pattern and update local gotchas or global domain standards.

## 🌿 2. Git & Commit Protocol
- **DO NOT commit or push code unless the user explicitly requests it.**
- Follow Conventional Commits in English: `feat:`, `fix:`, `refactor:`, `perf:`, `test:`.
- Do not run `git status` automatically unless asked.
- Never run dangerous commands: `git reset --hard`, `git checkout .`, `git clean -fd`.

## 📝 3. Work Logs & Reports
- **DO NOT automatically update work logs or reports** after each edit or commit.
- Update project logs only when the user explicitly prompts: "update work log", "ghi log", etc.

## 🛠️ 4. Multi-Domain Technical Rules
- **Game (Unity / Unreal):** See `scripted_AI/domain_standards/game/`. Unity requires 100% English for code, comments, UI, and logs. Zero GC in `Update()`.
- **Web (React / Next / Backend):** See `scripted_AI/domain_standards/web/`. Clean Architecture, Server vs Client components, OWASP security.
- **Desktop App (Tauri / .NET):** See `scripted_AI/domain_standards/app/`. Single instance mutex, non-blocking UI thread, IPC safety.
- **Mobile (Flutter / React Native):** See `scripted_AI/domain_standards/mobile/`. Sound null safety, offline-first SQLite sync, permission etiquette.
- **UI/UX Design System:** See `scripted_AI/skills/ui-ux-pro-max/SKILL.md`. Run `search.py --design-system` offline for palettes, typography, and stack UI best practices instead of reading raw CSVs.

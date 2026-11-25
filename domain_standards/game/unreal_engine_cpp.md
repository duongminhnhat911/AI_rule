# DOMAIN STANDARD: GAME DEVELOPMENT — UNREAL ENGINE (C++)
> **Mục tiêu:** Tiêu chuẩn lập trình Unreal Engine 5 C++, an toàn bộ nhớ UObject, tích hợp Gameplay Ability System (GAS) và ranh giới C++ vs Blueprint.

---

## 1. Ranh Giới C++ & Blueprint (The 80/20 Rule)
1. **C++ chịu trách nhiệm (Cốt lõi & Hiệu năng):**
   - Base Classes (Nhân vật gốc, vũ khí gốc, controller).
   - Thuật toán phức tạp, tính toán toán học, phân tích đường đi.
   - Kết nối mạng, đồng bộ hoá replication, quản lý inventory và persistence.
2. **Blueprint chịu trách nhiệm (Nội dung & Mỹ thuật):**
   - Kế thừa từ Base C++ class để tinh chỉnh thông số (visual tweaks).
   - Gắn Mesh, Animation Blueprint, Audio Cues, Particle Systems (Niagara).
   - Thiết kế level flow, cutscene, camera sequence.
3. **Tuyệt đối KHÔNG:**
   - Viết logic mạng nặng hoặc vòng lặp `Tick` phức tạp hoàn toàn bằng Blueprint.

---

## 2. Quản Lý Bộ Nhớ UObject & Garbage Collection
1. **Tránh Dangling Pointers:**
   - Mọi con trỏ trỏ tới `UObject` hoặc `AActor` phải được đánh dấu bằng macro `UPROPERTY()` để Unreal GC biết và không vô tình dọn rác đối tượng:
     ```cpp
     UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Combat")
     TObjectPtr<UWeaponComponent> ActiveWeapon;
     ```
2. **Sử dụng Smart Pointers cho dữ liệu thuần C++ (Non-UObject):**
   - Dùng `TSharedPtr`, `TSharedRef`, `TWeakPtr` cho các class C++ thông thường.
   - Dùng `TWeakObjectPtr<T>` khi cần trỏ tới Actor mà không muốn ngăn cản quá trình hủy của nó.

---

## 3. Quy Chuẩn Đặt Tên (Unreal Naming Conventions)
- Classes kế thừa từ `AActor`: Tiền tố **`A`** (ví dụ: `APlayerCharacter`).
- Classes kế thừa từ `UObject`: Tiền tố **`U`** (ví dụ: `UInventoryComponent`).
- Interfaces: Tiền tố **`I`** (ví dụ: `IDamageableInterface`).
- Structs: Tiền tố **`F`** (ví dụ: `FCombatDamageInfo`).
- Enums: Tiền tố **`E`** (ví dụ: `EWeaponFireMode`).
- Booleans: Tiền tố **`b`** (ví dụ: `bIsAttacking`).

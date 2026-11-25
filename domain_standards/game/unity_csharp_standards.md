# DOMAIN STANDARD: GAME DEVELOPMENT — UNITY (C#)
> **Mục tiêu:** Quy chuẩn lập trình game Unity chuyên nghiệp (Unity 2022 LTS / Unity 6), tối ưu hiệu năng, kiến trúc sạch và triệt tiêu lỗi Garbage Collection.

---

## 1. Quy Chuẩn Ngôn Ngữ Bắt Buộc (English Only)
- **100% Tiếng Anh (English)** trong toàn bộ dự án Unity:
  - Tên class, struct, enum, function, property, variable.
  - Text hiển thị trên UI (Title, labels, buttons, dialogs, notifications).
  - Code comments, XML documentation tags (`<summary>`).
  - Runtime logs (`Debug.Log`, `Debug.LogWarning`, `Debug.LogError`).
  - **Tuyệt đối KHÔNG viết tiếng Việt trong code hoặc assets của dự án Unity.**

---

## 2. Quản Lý Bộ Nhớ & Garbage Collection (Zero GC in Hot Path)
1. **Hàm `Update()`, `FixedUpdate()`, `LateUpdate()`:**
   - **CẤM** gọi `GetComponent<T>()` hoặc `FindObjectOfType<T>()`. Mọi tham chiếu component phải được cache ở `Awake()` hoặc `Start()`.
   - **CẤM** tạo đối tượng mới (`new MyClass()`, `new List<T>()`). Phải tái sử dụng danh sách hoặc dùng Object Pool.
   - **CẤM** dùng chuỗi động (String Concatenation `str1 + str2`). Dùng `StringBuilder` hoặc cache chuỗi định dạng.
   - **CẤM** dùng LINQ (`.Where()`, `.Select()`, `.ToList()`) trong vòng lặp chính vì LINQ sinh rác bộ nhớ (Garbage) liên tục.
2. **Object Pooling:**
   - Mọi thực thể sinh ra và biến mất liên tục (đạn đạn, hạt hiệu ứng particle, quái spawn, floating text) **bắt buộc** phải dùng `ObjectPool<T>` (sử dụng `UnityEngine.Pool.ObjectPool` hoặc custom pool).

---

## 3. Kiến Trúc Script & Component Isolation
1. **Cô Lập Điều Khiển Trong Multiplayer / Co-op:**
   - Các script input của người chơi (`PlayerInput`, `PlayerController`) **chỉ được chạy trên nhân vật của Local Player** (`isLocalPlayer == true` hoặc `isOwner`).
   - Tuyệt đối không để Remote Player nhận input từ máy cục bộ.
2. **Tách Biệt Dữ Liệu & Hành Vi (Data-Driven Design):**
   - Sử dụng `ScriptableObject` để chứa thông số cấu hình (chỉ số vũ khí, thuộc tính quái, công thức scale máu).
   - Không hardcode các hằng số game trong file MonoBehaviour.
3. **Thao Tác Với UI Canvas:**
   - Điều khiển UI thông qua các script C# gắn vào Canvas / Panel.
   - **CẤM** sửa trực tiếp code YAML thô của file `.prefab` hoặc `.unity` để tránh corrupt metadata và GUID.

---

## 4. Mẫu Cấu Trúc Class MonoBehaviour Chuẩn
```csharp
using UnityEngine;

namespace ProjectName.Gameplay.Combat
{
    /// <summary>
    /// Controls weapon firing and projectile pooling.
    /// </summary>
    [RequireComponent(typeof(AudioSource))]
    public class WeaponController : MonoBehaviour
    {
        [Header("Configuration")]
        [SerializeField] private WeaponData weaponData;
        [SerializeField] private Transform firePoint;

        private AudioSource _audioSource;
        private float _lastFireTime;

        private void Awake()
        {
            _audioSource = GetComponent<AudioSource>();
        }

        public bool TryFire()
        {
            if (Time.time < _lastFireTime + weaponData.FireCooldown)
                return false;

            _lastFireTime = Time.time;
            ExecuteFire();
            return true;
        }

        private void ExecuteFire()
        {
            // Spawn projectile from pool
        }
    }
}
```

# DOMAIN STANDARD: WEB DEVELOPMENT — MODERN FRONTEND (REACT / NEXT.JS)
> **Mục tiêu:** Tiêu chuẩn phát triển Frontend hiện đại với React 19, Next.js App Router, TypeScript, TailwindCSS và tối ưu Web Vitals.

---

## 1. Kiến Trúc Next.js App Router & Server Components
1. **Server Components (RSC) vs Client Components:**
   - Mặc định mọi component trong App Router là **Server Component**.
   - Chỉ thêm `"use client"` khi component cần:
     - State (`useState`, `useReducer`).
     - Effects (`useEffect`).
     - Event listeners (`onClick`, `onChange`).
     - Browser APIs (`localStorage`, `window`, `navigator`).
2. **Data Fetching:**
   - Fetch dữ liệu trực tiếp trên Server Component bằng `fetch()` có caching (`{ next: { revalidate: 3600 } }`).
   - Sử dụng React Suspense và `loading.tsx` để hiển thị skeleton loading, chống hiện tượng layout shift.

---

## 2. Quản Lý Trạng Thái (State Management)
1. **Server State vs Client State:**
   - Dùng **TanStack Query (React Query)** hoặc Next.js Server Actions cho dữ liệu lấy từ API/DB (hỗ trợ tự động cache, retry, invalidate).
   - Dùng **Zustand** cho Global Client State đơn giản (Theme, User Session, Giỏ hàng).
   - **Tránh** nhồi nhét state cục bộ vào Redux cồng kềnh nếu ứng dụng không đòi hỏi quá phức tạp.
2. **Form Handling & Validation:**
   - Sử dụng **React Hook Form** kết hợp với **Zod schema** để validate dữ liệu chặt chẽ cả ở Client lẫn Server Action.

---

## 3. UI/UX & TailwindCSS Clean Rules
1. **Tránh Class Name Rác (Spaghetti Tailwind):**
   - Dùng hàm `cn()` (`clsx` + `tailwind-merge`) để merge conditional class.
   - Khi có cụm class lặp lại quá 3 lần, tách thành component nhỏ hoặc tạo UI primitive (Button, Card, Badge).
2. **Tối ưu Web Vitals:**
   - Dùng thẻ `<Image />` của Next.js với thuộc tính `priority` cho các ảnh trên nếp gấp màn hình (LCP - Largest Contentful Paint).
   - Tránh re-render không cần thiết bằng `useCallback`, `useMemo` ở các component tính toán nặng.

---

## 4. Mẫu Component Chuẩn
```tsx
"use client";

import React, { useState } from "react";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

interface UserProfileCardProps {
  userId: string;
  initialName: string;
  avatarUrl?: string;
  className?: string;
}

export function UserProfileCard({ userId, initialName, avatarUrl, className }: UserProfileCardProps) {
  const [isEditing, setIsEditing] = useState(false);

  return (
    <div className={cn("rounded-xl border border-border bg-card p-4 shadow-sm", className)}>
      <div className="flex items-center gap-3">
        {avatarUrl ? (
          <img src={avatarUrl} alt={initialName} className="h-10 w-10 rounded-full object-cover" />
        ) : (
          <div className="flex h-10 w-10 items-center justify-center rounded-full bg-primary text-primary-foreground font-semibold">
            {initialName.charAt(0).toUpperCase()}
          </div>
        )}
        <div>
          <h3 className="font-medium text-foreground">{initialName}</h3>
          <p className="text-xs text-muted-foreground">ID: {userId}</p>
        </div>
      </div>
      <div className="mt-4 flex justify-end">
        <Button variant="outline" size="sm" onClick={() => setIsEditing(!isEditing)}>
          {isEditing ? "Đóng" : "Chỉnh sửa"}
        </Button>
      </div>
    </div>
  );
}
```

# Motion Plus Animation Improvements Plan

## Overview
Enhance 1shot.chat animations using Motion Plus MCP patterns to create a more polished, premium feel.

---

## Current State Summary
- **9 files** with Motion animations
- Spring physics used inconsistently (4 different spring configs)
- Basic fade/slide patterns dominate
- No scroll-based animations
- Limited gesture interactions beyond `whileTap`

---

## Proposed Improvements

### 1. Standardize Spring Configurations
**Files:** All animation files
**Why:** Currently 4 different spring configs create inconsistent feel

Create shared spring presets:
```tsx
// src/lib/motion-presets.ts
export const springs = {
  snappy: { stiffness: 500, damping: 30 },      // Buttons, pills
  smooth: { stiffness: 300, damping: 25 },      // Modals, dropdowns
  bouncy: { stiffness: 400, damping: 20 },      // Playful elements
  drawer: { stiffness: 400, damping: 30, mass: 0.8 }  // Drawers
}
```

---

### 2. Add Scroll Progress Indicator
**File:** `src/app/browse/page.tsx`
**Pattern:** `motion://examples/react/scroll-linked-with-spring`

Add a spring-smoothed scroll progress bar at the top of the browse page when scrolling through prompts.

---

### 3. Upgrade Prompt Card Interactions
**File:** `src/app/p/[slug]/page.tsx`
**Improvements:**
- Add `whileHover` scale effect (subtle 1.02x)
- Add tilt effect on hover for depth
- Improve copy button feedback with icon rotation + checkmark swap

---

### 4. Physical Stagger for Prompt Grid
**Files:** `src/app/page.tsx`, `src/app/browse/page.tsx`
**Pattern:** `motion://examples/react/staggered-grid`

Replace linear delay stagger with distance-based physical stagger:
- Calculate distance from center/origin
- Apply delay based on physical distance
- Creates ripple effect instead of sequential reveal

---

### 5. Enhanced Options Drawer
**File:** `src/components/OptionsDrawer.tsx`
**Improvements:**
- Add backdrop blur animation (0 -> 10px on open)
- Improve skeleton shimmer with `useSpring`
- Add subtle bounce on option card selection

---

### 6. Roll Button Micro-interactions
**File:** `src/app/page.tsx`
**Improvements:**
- Add anticipation (slight pull-back before action)
- Success state with confetti-style particles or scale pulse
- Dice/shuffle icon rotation animation

---

### 7. Header Dropdown Enhancement
**File:** `src/components/Header.tsx`
**Already good, minor tweaks:**
- Add staggerChildren to menu items
- Slight scale reduction on close for depth

---

### 8. Accessibility: Reduced Motion Support
**Files:** All animation files
**Add global reduced motion check:**
```tsx
const prefersReducedMotion =
  typeof window !== 'undefined' &&
  window.matchMedia("(prefers-reduced-motion: reduce)").matches
```

---

## Implementation Order

**User selected: ALL improvements + Motion Plus premium access**

| Step | Enhancement | Files |
|------|------------|-------|
| 1 | Create spring presets file | `src/lib/motion-presets.ts` (NEW) |
| 2 | Physical stagger grid | `src/app/page.tsx`, `src/app/browse/page.tsx` |
| 3 | Scroll progress bar | `src/app/browse/page.tsx` |
| 4 | Prompt card hover + tilt | `src/app/p/[slug]/page.tsx` |
| 5 | Roll button micro-interactions | `src/app/page.tsx` |
| 6 | Options drawer polish | `src/components/OptionsDrawer.tsx` |
| 7 | Header dropdown stagger | `src/components/Header.tsx` |
| 8 | Reduced motion support | All files |

---

## Motion Plus Setup Required
User has auth token. Will install via:
```bash
bun add https://api.motion.dev/registry?package=motion-plus&version=2.0.2&token=YOUR_AUTH_TOKEN
```
Enables: `Typewriter`, and other premium components from `motion-plus/react`

---

## Files to Modify
- `src/lib/motion-presets.ts` (NEW)
- `src/app/page.tsx`
- `src/app/browse/page.tsx`
- `src/app/p/[slug]/page.tsx`
- `src/components/OptionsDrawer.tsx`
- `src/components/Header.tsx`

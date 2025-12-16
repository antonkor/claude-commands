---
name: css-animation-debug
description: Debug CSS animations and @starting-style using Chrome DevTools 143. Analyze framer-motion animations, detect performance issues, and optimize animation timing.
---

# CSS Animation Debug Skill

Debug CSS entry animations using Chrome DevTools 143's new @starting-style support and animation adorners in the Elements panel.

## What This Does

1. **Detect Animations** - Find all CSS animations, transitions, and framer-motion animations
2. **@starting-style Support** - Debug CSS entry animations with new DevTools adorner
3. **Performance Analysis** - Check if animations cause layout thrashing or jank
4. **Timing Analysis** - Inspect animation duration, delay, and easing
5. **Optimization Suggestions** - Recommend GPU-accelerated properties

## Prerequisites

- Chrome DevTools MCP server installed
- Chrome 143+ for @starting-style support

## Quick Commands

```
"Find all animations on http://localhost:3101"
"Debug the hero section animations"
"Check if animations are causing performance issues"
"Analyze framer-motion animations on the page"
"Optimize animations for better FPS"
```

## Chrome 143 Features

### @starting-style Adorner
**What it is:** New DevTools UI element that shows CSS entry animations
**Use:** `"Show @starting-style animations on the homepage"`

### Animation Inspection
- Initial state detection
- Final state analysis
- Transition properties
- Animation timeline

## Common Patterns

### Detect All Animations
```
"Find all animations on http://localhost:3101:
- CSS transitions
- CSS animations (@keyframes)
- framer-motion animations
- @starting-style entries
Report: element, property, duration, delay"
```

### framer-motion Analysis
```
"Analyze framer-motion animations:
- initial state
- animate state
- transition settings
- viewport triggers (whileInView)
- stagger effects"
```

### Performance Check
```
"Check animation performance:
- Animations triggering layout recalc
- Non-GPU-accelerated properties
- Animation FPS
- Main thread blocking
Suggest: Use transform/opacity instead"
```

### Entry Animation Debug
```
"Debug page entry animations:
- @starting-style rules
- Initial state
- Final state
- Transition timing
- Stagger sequence"
```

## Animation Best Practices

### GPU-Accelerated Properties (Fast)
```
✅ transform (translate, scale, rotate)
✅ opacity
✅ filter
```

### Layout-Triggering Properties (Slow)
```
❌ width, height
❌ top, left, right, bottom
❌ margin, padding
```

### framer-motion Optimization
```jsx
// Good - GPU accelerated
<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
/>

// Bad - triggers layout
<motion.div
  initial={{ height: 0 }}
  animate={{ height: 'auto' }}
/>
```

## MCP Tools Used

- `execute_script` - Detect animations via JavaScript
- `element_inspection` - Inspect computed styles
- `record_trace` - Measure animation performance
- `take_screenshot` - Capture animation states

## Quick Optimization Guide

### Issue: Animation Jank
**Solution:** Use transform instead of position properties

### Issue: Slow Entry Animations
**Solution:** Reduce duration, optimize properties

### Issue: Layout Shift During Animation
**Solution:** Reserve space with min-height/aspect-ratio

### Issue: Multiple Animations Fighting
**Solution:** Coordinate timing with delays

---
**Created:** December 16, 2025
**Chrome DevTools 143 Feature:** @starting-style support and animation adorners

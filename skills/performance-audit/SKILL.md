---
name: performance-audit
description: Comprehensive performance analysis using Chrome DevTools MCP. Records performance traces with source maps, measures Core Web Vitals, identifies bottlenecks, and provides optimization recommendations.
---

# Performance Audit Skill

Automate performance testing using Chrome DevTools MCP's improved trace sharing with source maps and resource content.

## What This Does

1. **Record Performance Traces** - Capture complete performance data with source maps
2. **Core Web Vitals** - Measure LCP, FID, CLS automatically
3. **Bottleneck Identification** - Find slow scripts, resources, and render-blocking assets
4. **Network Analysis** - Analyze request timing and optimization opportunities
5. **Optimization Recommendations** - Actionable suggestions based on trace data

## Prerequisites

- Chrome DevTools MCP server installed
- Site running (local or deployed)

## Quick Commands

```
"Audit performance of http://localhost:3101"
"Measure Core Web Vitals for the homepage"
"Find performance bottlenecks on the pricing page"
"Analyze which resources are slowing down the page"
"Record a trace with source maps for the dashboard"
```

## Core Web Vitals

### LCP (Largest Contentful Paint)
**Target:** < 2.5 seconds
**What it measures:** Time until largest content element is visible
**Command:** `"Measure LCP for http://localhost:3101"`

### FID (First Input Delay)
**Target:** < 100 milliseconds
**What it measures:** Time from first interaction to browser response
**Command:** `"Measure FID on the interactive dashboard"`

### CLS (Cumulative Layout Shift)
**Target:** < 0.1
**What it measures:** Visual stability during page load
**Command:** `"Check CLS on the homepage"`

## Common Patterns

### Full Performance Audit
```
"Run complete performance audit on http://localhost:3101:
1. Record performance trace with source maps
2. Measure all Core Web Vitals
3. List slow resources (>500ms)
4. Identify render-blocking scripts
5. Analyze long tasks (>50ms)
6. Provide optimization recommendations"
```

### Quick Performance Check
```
"Quick performance check: LCP, FID, CLS for http://localhost:3101"
```

### Network Performance
```
"Analyze network performance:
- List all requests
- Show request timing
- Identify slow requests
- Report total page weight
- Suggest caching opportunities"
```

### Script Performance
```
"Analyze JavaScript performance:
- Total script execution time
- Long tasks blocking main thread
- Scripts with source maps
- Optimization suggestions"
```

## MCP Tools Used

- `record_trace` - Performance trace recording
- `list_network_requests` - Network analysis
- `execute_script` - Performance metrics collection
- `navigate` - Page navigation
- `wait_for_network_idle` - Ensure complete page load

## Best Practices

1. **Wait for Network Idle** - Ensure all resources loaded before measuring
2. **Multiple Runs** - Average results from 3+ runs for accuracy
3. **Realistic Conditions** - Test with throttling for mobile users
4. **Source Maps Enabled** - Get detailed script performance data
5. **Clear Cache** - Test first-visit experience

## Example Reports

### Good Performance
```
✅ LCP: 1.8s (Good - under 2.5s)
✅ FID: 45ms (Good - under 100ms)
✅ CLS: 0.05 (Good - under 0.1)
Overall: Excellent performance
```

### Needs Improvement
```
⚠️ LCP: 3.2s (Needs improvement - target <2.5s)
  - Largest element: Hero image (1.2MB)
  - Recommendation: Optimize image, use WebP, lazy load
✅ FID: 78ms (Good)
⚠️ CLS: 0.15 (Needs improvement - target <0.1)
  - Cause: Late-loading web fonts
  - Recommendation: Preload fonts, use font-display: swap
```

---
**Created:** December 16, 2025
**Chrome DevTools 143 Feature:** Improved trace sharing with source maps

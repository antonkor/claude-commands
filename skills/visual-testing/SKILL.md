---
name: visual-testing
description: Automated visual regression testing using Chrome DevTools MCP. Captures screenshots at multiple breakpoints and devices for visual QA and comparison.
---

# Visual Testing Skill

Automate visual regression testing using Chrome DevTools MCP server. Capture screenshots at different breakpoints, devices, and pages for comprehensive visual QA.

## What This Does

1. **Multi-Breakpoint Testing** - Test responsive layouts at mobile, tablet, and desktop sizes
2. **Device Emulation** - Test on specific devices (iPhone, Android, iPad, etc.)
3. **Full-Page Screenshots** - Capture entire pages including below-the-fold content
4. **Visual Comparison** - Create baseline screenshots for regression testing
5. **Accessibility Snapshots** - Capture accessibility tree for a11y testing

## Prerequisites

- Chrome DevTools MCP server installed and connected
- Development server running (or deployed URL)
- Claude Code with MCP support

## Usage

### Basic Screenshot
```
"Take a screenshot of http://localhost:3101"
```

### Multi-Breakpoint Testing
```
"Test http://localhost:3101 at mobile, tablet, and desktop sizes"
```

### Device Emulation
```
"Test http://localhost:3101 on iPhone 12 Pro and iPad Air"
```

### Full-Page Screenshot
```
"Take a full-page screenshot of http://localhost:3101/pricing"
```

### Multiple Pages
```
"Screenshot all pages: homepage, pricing, and about at desktop and mobile sizes"
```

## Common Test Patterns

### Pattern 1: Responsive Layout Testing
**Goal:** Verify layouts work at all breakpoints

**Command:**
```
"Test http://localhost:3101 at these breakpoints:
- Mobile: 375x667
- Tablet: 768x1024
- Desktop: 1440x900
- Large Desktop: 1920x1080"
```

**Expected Output:**
- 4 screenshots showing layout at each breakpoint
- Report of any layout issues (overflow, clipping, etc.)

### Pattern 2: Cross-Device Testing
**Goal:** Verify on specific devices

**Command:**
```
"Test http://localhost:3101 on:
- iPhone 12 Pro
- iPhone 12 Pro Max
- iPad Air
- Galaxy S21
- Pixel 5"
```

**Expected Output:**
- Screenshot for each device
- Device specifications used
- Any device-specific issues

### Pattern 3: Page Comparison
**Goal:** Compare pages for visual consistency

**Command:**
```
"Screenshot homepage, pricing, and about pages at desktop size for visual comparison"
```

**Expected Output:**
- Screenshots of all 3 pages
- Consistent header/footer rendering
- Font and color consistency report

### Pattern 4: Dark Mode Testing
**Goal:** Test dark mode appearance

**Command:**
```
"Test http://localhost:3101 in both light and dark mode at desktop size"
```

**Expected Output:**
- Light mode screenshot
- Dark mode screenshot
- Contrast and readability notes

### Pattern 5: Animation State Capture
**Goal:** Capture specific animation states

**Command:**
```
"Screenshot the hero section animation at:
1. Initial state
2. Mid-animation
3. Final state"
```

**Expected Output:**
- 3 screenshots showing animation progression
- Animation timing information

## Breakpoint Reference

### Standard Breakpoints
```
Mobile (Portrait):   375x667   (iPhone SE)
Mobile (Landscape):  667x375   (iPhone SE rotated)
Tablet (Portrait):   768x1024  (iPad Mini)
Tablet (Landscape):  1024x768  (iPad Mini rotated)
Desktop:            1440x900  (MacBook Pro)
Large Desktop:      1920x1080 (Full HD)
4K:                 3840x2160 (4K Monitor)
```

### Device Presets
```
iPhone 12 Pro:      390x844
iPhone 12 Pro Max:  428x926
iPhone SE:          375x667
iPad Air:           820x1180
iPad Pro 12.9:      1024x1366
Galaxy S21:         360x800
Pixel 5:            393x851
```

## MCP Tools Used

- **`navigate`** - Navigate to URLs
- **`take_screenshot`** - Capture page screenshots
- **`emulate_device`** - Emulate specific devices
- **`resize_viewport`** - Set custom viewport sizes
- **`wait_for_selector`** - Wait for elements to load
- **`execute_script`** - Run JavaScript for state manipulation

## Advanced Techniques

### Technique 1: Scroll-Based Screenshots
**Use Case:** Capture sticky headers, scroll effects

```
"Screenshot http://localhost:3101 at:
1. Top of page
2. Scrolled 500px
3. Bottom of page"
```

### Technique 2: Hover State Capture
**Use Case:** Test interactive element states

```
"Screenshot the navigation menu in:
1. Default state
2. Hover state on 'Pricing' link
3. Active/clicked state"
```

### Technique 3: Form State Testing
**Use Case:** Validate form rendering

```
"Screenshot the contact form with:
1. Empty fields
2. Filled fields
3. Validation errors
4. Success message"
```

### Technique 4: Loading State Capture
**Use Case:** Test loading indicators

```
"Screenshot the dashboard page:
1. Loading skeleton
2. Fully loaded with data"
```

### Technique 5: Modal/Dialog Testing
**Use Case:** Test overlays and modals

```
"Screenshot the page with:
1. Cookie consent modal
2. Newsletter signup modal
3. Video player modal"
```

## Visual Regression Workflow

### Step 1: Create Baseline
```
"Create baseline screenshots for visual regression testing:
- Homepage at mobile, tablet, desktop
- Pricing page at mobile, tablet, desktop
- About page at mobile, tablet, desktop
Save to: /screenshots/baseline/"
```

### Step 2: Make Changes
```
# Make code changes to your site
# Rebuild and restart dev server
```

### Step 3: Capture New Screenshots
```
"Capture new screenshots using same breakpoints:
Save to: /screenshots/current/"
```

### Step 4: Compare
```
"Compare baseline and current screenshots:
- Report any visual differences
- Highlight changed elements
- Flag potential regressions"
```

## Best Practices

### 1. Consistent Viewport Sizes
Use the same breakpoints across all tests for consistency:
```
Mobile: 375x667
Tablet: 768x1024
Desktop: 1440x900
```

### 2. Wait for Animations
Ensure animations complete before capturing:
```
"Wait for all animations to complete, then take screenshot"
```

### 3. Stable State
Wait for dynamic content to load:
```
"Wait for images and fonts to load before taking screenshot"
```

### 4. Naming Convention
Use descriptive names for screenshots:
```
homepage-desktop-1440x900.png
pricing-mobile-375x667.png
about-tablet-768x1024.png
```

### 5. Baseline Management
Store baselines in version control:
```
/screenshots/
  /baseline/
    homepage-desktop.png
    pricing-mobile.png
  /current/
    homepage-desktop.png
    pricing-mobile.png
```

## Troubleshooting

### Issue: Screenshots are blank
**Solutions:**
- Wait for page to fully load
- Check if dev server is running
- Verify URL is correct
- Increase wait time before capture

### Issue: Layout differs from manual test
**Solutions:**
- Verify viewport size matches
- Check for zoom level differences
- Ensure fonts are loaded
- Verify device emulation settings

### Issue: Animations causing inconsistent screenshots
**Solutions:**
- Disable animations temporarily
- Wait for specific animation completion
- Use `prefers-reduced-motion` CSS
- Capture at specific animation frame

### Issue: Images not loading
**Solutions:**
- Wait for network idle
- Check image paths are correct
- Verify CORS settings
- Ensure CDN is accessible

## Integration with CI/CD

### GitHub Actions Example
```yaml
- name: Visual Regression Testing
  run: |
    bun run dev &
    sleep 5
    claude run visual-test-all-pages
```

### Pre-Commit Hook
```bash
#!/bin/bash
# Visual test before committing UI changes
if git diff --name-only | grep -qE '\.(tsx|css)$'; then
  echo "UI files changed, running visual tests..."
  claude run visual-test-changed-pages
fi
```

## Example Test Suite

### TeamVault Marketing Site
```
"Run complete visual test suite:

1. Homepage
   - Desktop (1440x900)
   - Tablet (768x1024)
   - Mobile (375x667)

2. Pricing Page
   - Desktop with monthly pricing
   - Desktop with annual pricing
   - Mobile view

3. About Page
   - Desktop
   - Mobile

4. Contact Form
   - Empty state
   - Filled state
   - Error state

Save all screenshots to: /teamvault/screenshots/visual-tests/"
```

## Performance Considerations

### Optimize Screenshot Capture
- Use headless mode for faster execution
- Disable unnecessary network requests
- Skip non-critical animations
- Reuse browser instance

### Batch Testing
```
"Batch test all pages in a single browser session:
1. Open browser once
2. Navigate to each page
3. Capture screenshot
4. Move to next page
5. Close browser when complete"
```

## Accessibility Integration

### Combined Visual + A11y Testing
```
"Test http://localhost:3101 for:
1. Visual appearance (screenshot)
2. Accessibility tree snapshot
3. Color contrast issues
4. Keyboard navigation

Report both visual and a11y issues"
```

## Related Skills

- **performance-audit** - Combine with visual testing for complete QA
- **css-animation-debug** - Debug animation issues found in visual tests
- **accessibility-audit** - Ensure visual changes don't harm accessibility
- **form-testing** - Test form interactions and visual feedback

## Resources

- [Chrome DevTools MCP GitHub](https://github.com/ChromeDevTools/chrome-devtools-mcp)
- [Visual Regression Testing Guide](https://www.browserstack.com/guide/visual-regression-testing)
- [Responsive Design Breakpoints](https://www.freecodecamp.org/news/css-media-queries-breakpoints-media-types-standard-resolutions-and-more/)

---
**Created:** December 16, 2025
**MCP Server:** chrome-devtools-mcp
**Tools Used:** navigate, take_screenshot, emulate_device, resize_viewport

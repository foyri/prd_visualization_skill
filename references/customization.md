# Customization Guide

## Theme Colors

Edit CSS variables in `assets/hierarchy-visualizer.html` (lines ~78-103):

```css
:root {
  --bg-primary: #ffffff;
  --bg-secondary: #f9f9f9;
  --accent-color: #0066cc;
  /* ... */
}

body.dark {
  --bg-primary: #1a1a2e;
  --accent-color: #4dabf7;
  /* ... */
}
```

## Status Colors

Modify `STATUS_COLORS` object (line ~902):

```javascript
const STATUS_COLORS = {
  todo: '#8b949e',
  processing: '#e3b341', 
  problem: '#ffa657',
  done: '#238636'
};
```

## Default Parameters

Adjust fractal tree defaults in `DEFAULTS` object (line ~908):

```javascript
const DEFAULTS = {
  trunkSpacing: 80,
  branchAngleLeft: -30,
  branchAngleRight: 30,
  strokeWidth: 1.5
};
```

## Auto-Sync Interval

Change polling frequency (line ~950):

```javascript
setInterval(loadData, 5000); // 5 seconds
```

# Hierarchy Data Format Reference

Complete specification for the JSON data format used by the hierarchy visualizer.

## Required Fields (Per Node)

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier across entire tree |
| `title` | string | Display name shown in visualization |
| `status` | string | One of: `todo`, `processing`, `problem`, `done` |
| `children` | array | Child nodes (empty array for leaf nodes) |

## Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Node category: `prd`, `section`, `feature`, `requirement` |
| `domain` | string | Parent domain or category name |
| `stage` | string | Development stage: `planning`, `design`, `development`, `testing`, `released` |
| `owning_sig` | string | Team or group responsible |
| `granularity` | string | Detail level: `coarse`, `medium`, `fine` |
| `complexity` | string | Complexity rating: `low`, `medium`, `high` |
| `source_url` | string | Link to source (GitHub, Jira, etc.) |
| `goals` | array | Array of goal strings |

## Status Colors

| Status | Color | Use Case |
|--------|-------|----------|
| `todo` | Gray (#8b949e) | Not started |
| `processing` | Yellow (#e3b341) | In progress |
| `problem` | Orange (#ffa657) | Blocked or has issues |
| `done` | Green (#238636) | Completed |

## Example Structure

```json
{
  "id": "root",
  "title": "Product Requirements Document",
  "status": "processing",
  "type": "prd",
  "children": [
    {
      "id": "auth",
      "title": "Authentication System",
      "status": "done",
      "type": "section",
      "stage": "released",
      "owning_sig": "Platform Team",
      "children": [
        {
          "id": "oauth",
          "title": "OAuth 2.0 Integration",
          "status": "done",
          "type": "feature",
          "complexity": "medium",
          "source_url": "https://github.com/org/repo/issues/123"
        }
      ]
    }
  ]
}
```

## Validation Rules

1. All `id` values must be unique across the entire tree
2. `status` must be one of the four defined values
3. `children` must always be present (use empty array `[]` for leaves)
4. Maximum recommended depth: 10 levels (performance degrades beyond this)
5. Maximum recommended total nodes: 1000 (for smooth interactivity)

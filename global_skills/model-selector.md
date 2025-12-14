# Model Selection Guide (Global)

A guide for selecting the right AI model for the task based on cost, speed, and intelligence.

## Model Tier Strategy

| Tier | Recommended Models | Use Case |
| :--- | :--- | :--- |
| **S-Tier (Reasoning)** | `gpt-5`, `gemini-2.0-pro` | Complex architectural decisions, debugging subtle bugs, high-stakes code generation. |
| **A-Tier (Balanced)** | `claude-3-5-sonnet`, `gemini-1.5-pro` | General coding, refactoring, content generation. |
| **B-Tier (Speed/Vision)** | `gpt-5-mini`, `gemini-2.0-flash` | Vision tasks, quick scripts, simple JSON data extraction. |
| **C-Tier (Economy)** | `gpt-5-nano`, `gemini-1.5-flash` | high-volume categorization, simple chatter, "is this sentiment positive?" tasks. |

## Image Generation Models

| Model | Cost | Use Case |
| :--- | :--- | :--- |
| `gpt-image-1-mini` | Budget | Quick previews, placeholders. |
| `gpt-image-1` | Premium | High quality, final marketing assets. |
| `imagen-3` | Diverse | Stylized artistic generation. |

## API Implementation Notes

*   **Context Window**: Always check if the model supports the context size needed (e.g. 1M+ tokens for codebase-wide queries).
*   **Structured Output**: Use `response_format: { type: "json_object" }` or equivalent schema validation where possible.
*   **Streaming**: Always implement streaming for user-facing text generation to reduce perceived latency.

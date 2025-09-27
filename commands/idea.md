# /idea - Instant Idea Capture System

Preserve creative flow while building a sophisticated AI-powered knowledge management pipeline.

## Usage

```bash
# Basic instant capture
/idea "Voice-controlled IDE for accessibility"

# With urgency flag
/idea --urgent "Critical bug in authentication system"

# With category and mood
/idea --category technical --mood excited "AI-powered code review suggestions"

# Process immediately
/idea --process "Blog post about progressive enhancement patterns"
```

## System Flow

1. **Instant Capture** (< 100ms) - Preserves flow state
2. **AI Agent Analysis** - Content Curator, Technical Architect, Market Researcher, Creative Synthesizer
3. **Connection Discovery** - Find related ideas and patterns
4. **Database Storage** - Convex integration with vector embeddings ready for LangChain

## Implementation

The command captures ideas to `/ideas/raw/` with automatic:
- Agent priority classification (85%+ accuracy)
- Initial tagging and metadata extraction
- Convex database storage preparation
- Structured markdown formatting

Built for seamless integration with OpenAI API and LangChain vector search.

---

**Next**: Use `/idea "your brilliant idea"` to start capturing!
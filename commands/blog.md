# Blog Command

Create a comprehensive blog post draft about current development work with SEO optimization and tutorial content.

## Command Usage
```
/blog [topic description]
```

## Blog Post Structure

When creating a blog post, include:

1. **Metadata**:
   - Title (SEO optimized)
   - Status: draft
   - Date created
   - Keywords (10-15 relevant terms)
   - Hashtags (Twitter/LinkedIn/Instagram)
   - Google AI search queries (5-7 questions)
   - Reading time estimate
   - XP points (for gamification)

2. **Content Sections**:
   - Introduction with problem statement
   - Main content with clear headings
   - Code examples (if technical)
   - Brief tutorial (if applicable)
   - Key takeaways
   - Next steps/CTA

3. **SEO Elements**:
   - Meta description (155 chars)
   - Focus keyphrase
   - Related searches
   - FAQ section

4. **Analytics Integration**:
   - PostHog experiment ID
   - Conversion goals
   - Engagement metrics to track

## File Creation

Save blog posts to: `/blog/[yyyy-mm-dd]-[slug].md`

## Convex Schema

Include schema for blog storage:
```typescript
// convex/schema.ts
export const blogPosts = defineTable({
  title: v.string(),
  slug: v.string(),
  content: v.string(),
  status: v.union(v.literal("draft"), v.literal("published"), v.literal("archived")),
  keywords: v.array(v.string()),
  hashtags: v.array(v.string()),
  googleQueries: v.array(v.string()),
  metadata: v.object({
    readingTime: v.number(),
    xpPoints: v.number(),
    author: v.string(),
    category: v.string(),
    featuredImage: v.optional(v.string()),
  }),
  analytics: v.object({
    posthogExperimentId: v.optional(v.string()),
    conversionGoals: v.array(v.string()),
    engagementMetrics: v.array(v.string()),
  }),
  seo: v.object({
    metaDescription: v.string(),
    focusKeyphrase: v.string(),
    relatedSearches: v.array(v.string()),
  }),
  createdAt: v.number(),
  updatedAt: v.number(),
  publishedAt: v.optional(v.number()),
})
.index("by_status", ["status"])
.index("by_slug", ["slug"])
.searchIndex("search_content", {
  searchField: "content",
  filterFields: ["status", "keywords"]
});
```

## JSON Rendering Structure

```json
{
  "posts": [
    {
      "id": "unique-id",
      "title": "Blog Title",
      "slug": "blog-slug",
      "excerpt": "Brief excerpt...",
      "content": "Full markdown content",
      "status": "draft",
      "metadata": {
        "date": "2025-01-20",
        "readingTime": 5,
        "xpPoints": 100,
        "author": "Anton",
        "category": "Development"
      },
      "seo": {
        "keywords": ["keyword1", "keyword2"],
        "hashtags": ["#coding", "#webdev"],
        "googleQueries": [
          "How to implement spec-kit?",
          "What is specification-driven development?"
        ],
        "metaDescription": "Learn how to...",
        "focusKeyphrase": "spec-kit development"
      },
      "analytics": {
        "posthogExperimentId": "exp_blog_engagement_001",
        "trackingEvents": ["view", "scroll", "share", "complete"]
      }
    }
  ]
}
```

## Tutorial Template

For tutorial blog posts, include:

1. **Prerequisites**
2. **Step-by-step instructions**
3. **Code snippets with syntax highlighting**
4. **Interactive exercises** (marked for future XP implementation)
5. **Common pitfalls**
6. **Resources for further learning**

## Example Google AI Search Queries

Generate queries that would trigger AI summaries:
- "How to [solve specific problem]"
- "What is [technology/concept] used for"
- "Best practices for [topic]"
- "[Topic] vs [Alternative] comparison"
- "Step by step guide to [task]"

## PostHog Experiment Integration

Each blog post should include:
- Experiment variant (A/B testing different formats)
- Custom events for engagement tracking
- Conversion goals (newsletter signup, tool usage, etc.)

---

This command helps maintain a consistent blog content strategy with built-in analytics and SEO optimization.
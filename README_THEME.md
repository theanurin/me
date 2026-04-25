# theanurin-blog-eleventy-theme

## Notes

### ⚠️ Liquid `include` Scope Note

In Eleventy/Liquid, direct output of `include` parameters via `{{ include.param }}` often fails. **Always** assign them to local variables first to ensure they render correctly.

**Incorrect:**
`{{ include.key }}` -> *May render empty*

**Correct:**
```liquid
{% assign key = include.key %}
{{ key }}
```
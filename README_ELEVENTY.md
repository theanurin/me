Eleventy scaffold (minimal)

What I added:

- `package.json` — dev scripts for Eleventy
- `.eleventy.js` — Eleventy config, collections and a small date filter
- `src/_data/site.json` — site metadata (set `url` to your domain)
- `src/_data/i18n/` — minimal i18n JSON files (`uk`, `en`)
- `src/_includes/layouts/` — `base.njk` and `post.njk`
- `src/index.njk` and `src/en/index.njk` — minimal home pages
- `src/posts/{uk,en}/` — two sample posts with `eleventyComputed` permalink

How to run:

1. Install dependencies:

```bash
npm install
```

2. Run dev server:

```bash
npm run dev
```

3. Build for production:

```bash
npm run build
```

Notes and next steps:

- Update `src/_data/site.json` and set your real `url` for sitemap/rss.
- Move/migrate your Jekyll posts (from `content/` or `_posts`) into `src/posts/uk` and `src/posts/en`.
- Add RSS and sitemap templates and enable pagination, tag filters, and other features from `PROMPT.md`.

## Page Locale Resolution Use Cases

### Locale-Selector Items

- Opacity=1 for locales with existing page content
- Opacity=0.5 for locales with NON-existing page content

### Page Content

- Use case: Page exists for current locale
  - Show content of the page

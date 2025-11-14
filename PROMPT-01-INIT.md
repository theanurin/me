# Проєктний промпт: Персональний сайт + блог (UA/EN) на Eleventy (11ty)

Цей промпт сгенеровано за допомогою Copilot (агент Claude Sonnet 4.5)

Мета:
- Створити швидкий, простий у підтримці двомовний сайт з невеликим блогом.
- Контент — Markdown із фронтматером.
- Легка зміна базової логіки через шаблони, колекції та фільтри.

Cтек:

- Eleventy 3.1.2 (SSG, Node.js)
- Шаблони: Liquid
- Офіційний i18n-плагін: EleventyI18nPlugin (із @11ty/eleventy)
- RSS: @11ty/eleventy-plugin-rss
- Sitemap: @quasibit/eleventy-plugin-sitemap
- Зображення: @11ty/eleventy-img
- Markdown-it + плагіни (anchors/footnotes/attrs)
- CSS: Tailwind
- Деплой: GitHub Pages

---

## 1) Ключові вимоги

- Локалі: `uk` (з префіксом `/uk`) і `en` (з префіксом `/en`).
- Автоматичний редірект на `/uk` (якщо відкривають з кореня)
- Структура URL:
  - uk: `/uk/`, `/uk/blog/`, `/uk/blog/<slug>/`, `/uk/cv/`, `/uk/cv/developer/`, `/uk/en/devops/`, `/uk/cv/tech-lead/`, `/uk/cv/startup/`, `/uk/about/`
  - en: `/en/`, `/en/blog/`, `/en/blog/<slug>/`, `/en/cv/`, `/uk/en/developer/`, `/uk/en/devops/`, `/uk/en/tech-lead/`, `/uk/en/startup/`, `/en/about/`
- Контент — Markdown із фронтматером:
  - Пости: title, description, date, lang, tags, draft, cover, slug
  - Сторінки: about, contacts
- Списки:
  - Blog index з пагінацією, фільтр за тегами в межах локалі
  - Головна — інтро + останні пости
- SEO:
  - Локалізовані title/description, canonical, hreflang
  - OpenGraph/Twitter cards, прев’ю-обкладинка
  - sitemap.xml з альтернативами мов; RSS для кожної локалі
- Продуктивність:
  - Lighthouse 95+ на мобільних і десктопі
- Опційно:
  - Коментарі: Giscus (локалізація UI)
  - Аналітика: Plausible/Umami/GA4
- Тестовий контент: 3–5 постів на кожній мові

---

## 2) Структура проєкту

```
.
├─ src/                       # inputDir для Eleventy
│  ├─ posts/
│  │  ├─ uk/
│  │  │  ├─ 2025-01-hello-world.md
│  │  │  └─ 2025-02-another-post.md
│  │  └─ en/
│  │     ├─ 2025-01-hello-world.md
│  │     └─ 2025-02-another-post.md
│  ├─ pages/
│  │  ├─ uk/
│  │  │  └─ about.md
│  │  └─ en/
│  │     └─ about.md
│  ├─ _data/
│  │  ├─ site.json            # налаштування сайту, локалі
│  │  └─ i18n/
│  │     ├─ uk.json           # словники інтерфейсу
│  │     └─ en.json
│  ├─ _includes/
│  │  ├─ layouts/
│  │  │  ├─ base.njk
│  │  │  └─ post.njk
│  │  ├─ components/
│  │  │  ├─ header.njk
│  │  │  ├─ footer.njk
│  │  │  ├─ lang-switcher.njk
│  │  │  ├─ post-card.njk
│  │  │  └─ pagination.njk
│  │  └─ macros/
│  │     └─ seo.njk
│  ├─ index.njk               # uk
│  ├─ blog.njk                # uk: список постів + пагінація
│  ├─ en/
│  │  ├─ index.njk            # en
│  │  └─ blog.njk             # en: список постів + пагінація
│  └─ assets/
│     ├─ css/
│     │  └─ styles.css
│     └─ images/
├─ .eleventy.js
├─ package.json
├─ .eleventyignore
└─ README.md
```

Примітки:
- Вихідна папка (`dir.output`) — `dist/`.
- Дані `_data/site.json` містять `defaultLocale`, `locales` та назву сайту.

---

## 3) Модель контенту (Front matter)

Приклад поста (uk):
```md
---
title: "Привіт, світ!"
description: "Мій перший пост у блозі."
date: 2025-01-15
lang: "uk"
tags: ["intro", "personal"]
draft: false
cover: "/assets/images/hello.jpg"
slug: "hello-world"
layout: "layouts/post.njk"
---
Тестовий контент українською.
```

Англійська версія:
```md
---
title: "Hello, world!"
description: "My first blog post."
date: 2025-01-15
lang: "en"
tags: ["intro", "personal"]
draft: false
cover: "/assets/images/hello.jpg"
slug: "hello-world"
layout: "layouts/post.njk"
---
Test content in English.
```

Правила:
- `slug` однаковий у відповідних перекладах (для мапінгу між локалями).
- `draft: true` — виключати з білду продакшн/лише на прі перегляді.
- Уникати колізій `slug` у межах однієї локалі.

---

## 4) I18n-роутинг та перемикач мови

- Дефолтна локаль: `uk` без префікса.
- Локаль `en` з префіксом `/en`.
- Використати `EleventyI18nPlugin` для:
  - локалізованих шляхів,
  - генерації `hreflang` у head,
  - допоміжних фільтрів перекладу.

Перемикач мови:
- На сторінці поста знаходити альтернативу за `slug` в іншій локалі.
- Для статичних сторінок (about) — відповідний файл у `pages/en`/`pages/uk`.

---

## 5) Колекції, фільтри, обчислювані дані

- Колекції:
  - `posts_uk`: усі пости з `lang === "uk"` і `!draft`
  - `posts_en`: усі пости з `lang === "en"` і `!draft`
  - Мапа `bySlug`: об’єднана індексація постів за `slug` з посиланням на версії `uk`/`en` для LangSwitcher.

- Обчислюваний `permalink`:
  - Для постів: `(/en)?/blog/<slug>/`
  - Для сторінок: `(/en)?/<page>/`

- Фільтри:
  - Форматування дат (uk-UA, en-US)
  - Побудова canonical
  - Пошук альтернативних URL для `hreflang`

---

## 6) SEO та мета

- Компонент `seo.njk` із пропсами: `title`, `description`, `canonical`, `ogImage`, `locale`.
- В head:
  - `link rel="alternate" hreflang="uk"` і `hreflang="en"` для відповідних сторінок.
  - `link rel="alternate" hreflang="x-default"` на дефолтну версію.
- OpenGraph/Twitter Cards.
- JSON-LD:
  - Person (на головній/about)
  - BlogPosting (на сторінках постів)

---

## 7) Фіди, мапи, robots

- RSS:
  - `/rss.xml` для uk (останні N постів)
  - `/en/rss.xml` для en
- Sitemap:
  - `sitemap.xml` з усіма URL і `<xhtml:link rel="alternate" hreflang="...">`
- robots.txt:
  - дозвіл індексації продакшн-домена
  - noindex для прев’ю-деплоїв (якщо потрібно)

---

## 8) Мінімальний набір сторінок і компонентів

- Layouts:
  - `base.njk`: шапка, футер, LangSwitcher, SEO
  - `post.njk`: контент поста, next/prev у межах локалі
- Сторінки:
  - Home (uk/en): інтро + останні 5 постів
  - Blog index (uk/en): список постів з пагінацією + фільтр тегів
  - About (uk/en): статична сторінка
  - 404 (uk/en)
- Компоненти:
  - header, footer, post-card, pagination, lang-switcher, tag-list

Опційно:
- Коментарі Giscus
- Темна тема (prefers-color-scheme та перемикач)

---

## 9) Збірка, скрипти, деплой

- Node.js 20.x LTS
- Скрипти:
  - `npm run dev` — локальний сервер
  - `npm run build` — продакшн збірка в `dist/`
  - `npm run preview` — перегляд `dist/`
- CI (GitHub Actions):
  - Lint/Build на pull_request
  - Deploy на main:
    - Vercel (рекомендовано) — автоматичні прев’ю і продакшн
    - або GitHub Pages через actions/deploy-pages

---

## 10) Критерії приймання (Acceptance Criteria)

- [ ] Дві локалі: uk (дефолт), en; коректні маршрути, hreflang, canonical
- [ ] Контент у Markdown; 3–5 постів на кожній мові
- [ ] Blog index з пагінацією та фільтром тегів у межах локалі
- [ ] Окремі RSS: `/rss.xml` (uk) та `/en/rss.xml` (en)
- [ ] Sitemap з альтернативними лінками мов
- [ ] SEO-компонент: OG, Twitter, JSON-LD
- [ ] Lighthouse ≥ 95 (Performance/SEO/Best Practices/Accessibility)
- [ ] 404 для обох мов
- [ ] README з інструкціями запуску/деплою
- [ ] LangSwitcher, що веде на відповідну локалізовану сторінку

Опційно:
- [ ] Коментарі Giscus
- [ ] Темна тема
- [ ] Аналітика (Plausible/Umami)

---

## 11) Приклади конфігурації

.eleventy.js (скоротчено)
```js
const { EleventyI18nPlugin } = require("@11ty/eleventy");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const pluginSitemap = require("@quasibit/eleventy-plugin-sitemap");

module.exports = function(eleventyConfig) {
  // Статика
  eleventyConfig.addPassthroughCopy({ "src/assets": "assets" });

  // Плагіни
  eleventyConfig.addPlugin(EleventyI18nPlugin, {
    defaultLanguage: "uk",
    // Якщо використовуєте словники з _data/i18n
  });
  eleventyConfig.addPlugin(pluginRss);
  eleventyConfig.addPlugin(pluginSitemap, {
    sitemap: {
      hostname: "https://YOUR-DOMAIN",
    },
  });

  // Фільтри дат
  eleventyConfig.addFilter("dateLocale", (date, locale = "uk-UA", opts = {}) =>
    new Intl.DateTimeFormat(locale, { dateStyle: "medium", ...opts }).format(date)
  );

  // Колекції
  eleventyConfig.addCollection("posts_uk", (api) =>
    api.getFilteredByGlob("src/posts/uk/**/*.md").filter(p => !p.data.draft)
  );
  eleventyConfig.addCollection("posts_en", (api) =>
    api.getFilteredByGlob("src/posts/en/**/*.md").filter(p => !p.data.draft)
  );

  // Індекс за slug для LangSwitcher
  eleventyConfig.addCollection("bySlug", (api) => {
    const all = [
      ...api.getFilteredByGlob("src/posts/uk/**/*.md"),
      ...api.getFilteredByGlob("src/posts/en/**/*.md"),
    ].filter(p => !p.data.draft);

    const map = new Map();
    for (const p of all) {
      const slug = p.data.slug;
      const lang = p.data.lang;
      if (!map.has(slug)) map.set(slug, {});
      map.get(slug)[lang] = p;
    }
    return map;
  });

  return {
    dir: { input: "src", output: "dist", includes: "_includes", data: "_data" },
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
  };
};
```

Приклад Blog index (uk) з пагінацією (src/blog.njk)
```njk
---
pagination:
  data: collections.posts_uk
  size: 10
  alias: posts
permalink: "/blog/{% if pagination.pageNumber > 0 %}page/{{ pagination.pageNumber + 1 }}/{% endif %}"
layout: layouts/base.njk
title: "Блог"
---

<h1>{{ title }}</h1>
<ul>
{% for post in posts %}
  <li>
    <a href="{{ post.url }}">{{ post.data.title }}</a>
    <small>{{ post.date | dateLocale("uk-UA") }}</small>
  </li>
{% endfor %}
</ul>

{% include "components/pagination.njk" %}
```

RSS (uk) через eleventy-plugin-rss (src/rss-uk.njk)
```njk
---
permalink: "/rss.xml"
eleventyExcludeFromCollections: true
---
{% set feedTitle = "Блог (uk)" %}
{% set feedUrl = site.url + "/rss.xml" %}
{% set items = collections.posts_uk | reverse | head(20) %}
{{ rssFeed(items, { title: feedTitle, feed_url: feedUrl, site_url: site.url }) }}
```

Аналогічно для en: `src/en/rss.njk` з `permalink: "/en/rss.xml"` і `collections.posts_en`.

_site.json (src/_data/site.json)
```json
{
  "name": "YOUR NAME",
  "url": "https://YOUR-DOMAIN",
  "defaultLocale": "uk",
  "locales": ["uk", "en"]
}
```

---

## 12) Контентні приклади (чернетки)

`src/posts/uk/2025-01-hello-world.md`
```md
---
title: "Привіт, світ!"
description: "Мій перший пост у блозі."
date: 2025-01-15
lang: "uk"
tags: ["intro"]
draft: false
cover: "/assets/images/hello.jpg"
slug: "hello-world"
layout: "layouts/post.njk"
---

Ласкаво просимо до мого блогу! Це тестовий контент українською.
```

`src/posts/en/2025-01-hello-world.md`
```md
---
title: "Hello, world!"
description: "My first blog post."
date: 2025-01-15
lang: "en"
tags: ["intro"]
draft: false
cover: "/assets/images/hello.jpg"
slug: "hello-world"
layout: "layouts/post.njk"
---

Welcome to my blog! This is a test English post.
```

---

## 13) План робіт

1) Ініціалізувати Eleventy (2.x), налаштувати `inputDir=src`, `outputDir=dist`.
2) Додати плагіни: i18n, RSS, sitemap, img; налаштувати passthrough assets.
3) Запровадити структуру контенту (posts/pages uk/en), фронтматер, колекції за локалями.
4) Реалізувати layouts, header/footer, LangSwitcher (мапа за `slug`).
5) Головна та Blog index (uk/en) з пагінацією й фільтром тегів.
6) Сторінка поста з навігацією Next/Prev у межах локалі.
7) SEO: canonical, hreflang, OG/Twitter, JSON-LD.
8) RSS (uk/en), sitemap із альтернативами, robots.txt.
9) 404 (uk/en).
10) CI/CD: GitHub Actions (build + deploy), README інструкції.

---

## 14) Відкриті питання

- Домен і `site.url` для sitemap/RSS?
- Платформа деплою: Vercel чи GitHub Pages?
- Брендинг: кольори, логотип/аватар, фавікон?
- Чи підключаємо одразу Giscus/аналітику?
- Чи потрібні розділи Projects/Portfolio/CV?

---

## 15) Результат

Двомовний статичний сайт на Eleventy з блогом, локалізованими маршрутами, SEO, RSS/sitemap, контрольованою логікою через шаблони/колекції, і Markdown-контентом.
const path = require("path");
const fs = require("fs");
const toml = require("@iarna/toml");
const yaml = require("js-yaml");
const sass = require("sass");
const markdownIt = require("markdown-it");
const { HtmlBasePlugin, UserConfig } = require("@11ty/eleventy");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const pluginSitemap = require("@quasibit/eleventy-plugin-sitemap");

const siteConfig = {
  buildConfiguration: "snapshot",
  support_dark_mode: true,
  url: "https://example.com/", // Your site's base URL
  name: "theanurin",
  description:
    "Personal blog and landing site of Max Anurin, includes hobby/weekend projects",
  defaultLocale: "uk-UA",
  locales: {
    "uk-UA": {
      title: "Українська",
    },
    "en-GB": {
      title: "English",
    },
  },
  contact: {
    name: "Maksym Anurin",
    email: "theanurin@gmail.com",
    emailSubject: "Question from the blog",
    phone: "+380991379065",
  },
  socialProfiles: [
    { platform: "github", name: "GitHub", url: "https://github.com/theanurin" },
    { platform: "facebook", name: "Facebook", url: "https://www.facebook.com/theanurin42" },
    { platform: "stack-overflow", name: "Stack Overflow", url: "https://stackexchange.com/users/2288108/maksym-anurin" },
    { platform: "linkedin", name: "LinkedIn", url: "https://www.linkedin.com/in/theanurin/" },
    { platform: "reddit", name: "Reddit", url: "https://www.reddit.com/user/theanurin" },
    { platform: "whatsapp", name: "WhatsApp", url: "https://api.whatsapp.com/send/?phone=380991379065&text=%D0%9F%D1%80%D0%B8%D0%B2%D1%96%D1%82%21&type=phone_number&app_absent=0" },
    { platform: "telegram", name: "Telegram", url: "https://t.me/theanurin" },
    { platform: "youtube", name: "YouTube", url: "https://www.youtube.com/@theanurin42" },
    { platform: "viber", name: "Viber", url: "viber://pa?chatURI=380991379065" },
    { platform: "upwork", name: "Upwork", url: "https://www.upwork.com/freelancers/~018ef1b9d37e5a886b" },
    { platform: "x", name: "X", url: "https://x.com/theanurin" },
  ],
};

const POST_FILE_PATH_STEM_REGEX = /^\/posts\/(\d{4})\/\d+-([\w-]+)\/\w+$/;

/**
 * @param {UserConfig} eleventyConfig
 */
module.exports = function (eleventyConfig) {
  const md = markdownIt();

  eleventyConfig.addGlobalData("site", {
    ...siteConfig,
  });

  //
  // Configure 404 behaviour similar to GitHub Pages, GitLab Pages, etc.
  //
  // See: https://www.11ty.dev/docs/quicktips/not-found/
  //
  const page404File = path.join(__dirname, "src", "404.html");
  eleventyConfig.setBrowserSyncConfig({
    callbacks: {
      ready: function (err, bs) {
        bs.addMiddleware("*", (req, res) => {
          if (!fs.existsSync(page404File)) {
            throw new Error(
              `Expected a \`${page404File}\` file but could not find one. Did you create a 404.html template?`,
            );
          }

          const page404Content = fs.readFileSync(page404File);
          // Add 404 http status code in request header.
          res.writeHead(404, { "Content-Type": "text/html; charset=UTF-8" });
          // Provides the 404 content without redirect.
          res.write(page404Content);
          res.end();
        });
      },
    },
  });

  //
  // A build-time application of <base> to HTML (without relying on <base>)
  // by modifying a[href], video[src], audio[src], source, img[src], [srcset],
  // and more.
  //
  // See: https://www.11ty.dev/docs/plugins/html-base/
  //
  eleventyConfig.addPlugin(HtmlBasePlugin);

  // // Collections by locale (files now in subdirectories: /uk.md, /en.md)
  // eleventyConfig.addCollection("posts_uk", (collectionApi) =>
  //     collectionApi.getFilteredByGlob("src/posts/*/*/uk.md").filter((p) => !p.data.draft)
  // );

  // eleventyConfig.addCollection("posts_en", (collectionApi) =>
  //     collectionApi.getFilteredByGlob("src/posts/*/*/en.md").filter((p) => !p.data.draft)
  // );

  //
  // Custom Data File Formats
  //
  // See: https://www.11ty.dev/docs/data-custom/
  //
  // Read files like:
  // - ./src/_data/info/skills.yml
  // - ./src/_data/info/project.yml
  // etc
  //
  // lower priority
  eleventyConfig.addDataExtension("yml,yaml", (contents) =>
    yaml.load(contents),
  );
  // higher priority
  eleventyConfig.addDataExtension("toml", (contents) => toml.parse(contents));
  //

  //
  // Passthrough (keep existing assets where they are)
  //
  // See: https://www.11ty.dev/docs/copy/
  //
  eleventyConfig.addPassthroughCopy({ public: "." });

  // Add SCSS support
  // See https://www.11ty.dev/docs/languages/sass/
  eleventyConfig.addTemplateFormats("scss");
  eleventyConfig.addExtension("scss", {
    outputFileExtension: "css",

    // opt-out of Eleventy Layouts
    useLayouts: false,

    compile: async function (inputContent, inputPath) {
      const parsed = path.parse(inputPath);
      // Don’t compile file names that start with an underscore
      if (parsed.name.startsWith("_")) {
        return;
      }

      const result = sass.compileString(inputContent, {
        loadPaths: [parsed.dir || ".", this.config.dir.includes],
      });

      // Map dependencies for incremental builds
      this.addDependencies(inputPath, result.loadedUrls);

      return async (data) => {
        return result.css;
      };
    },
  });

  // // Plugins
  // eleventyConfig.addPlugin(pluginRss);
  // eleventyConfig.addPlugin(pluginSitemap, {
  //     sitemap: {
  //         hostname: "https://example.com",
  //     },
  // });

  // Allow permalinks that end with a trailing slash (no file extension)
  if (typeof eleventyConfig.configureErrorReporting === "function") {
    eleventyConfig.configureErrorReporting({ allowMissingExtensions: true });
  }

  eleventyConfig.addFilter("test", function (value) {
    console.error("test:value", value);
    return value;
  });

  //
  // Extend Liquid by some Jekyll-friendly filters
  //
  eleventyConfig.addLiquidFilter("capitalize_all", function (words) {
    return words.split(" ").map(capitalizeWord).join(" ");
  });

  // Date formatting
  eleventyConfig.addFilter("dateLocale", function (date, locale, opts = {}) {
    try {
      return new Intl.DateTimeFormat(locale, {
        dateStyle: "medium",
        ...opts,
      }).format(new Date(date));
    } catch (e) {
      console.error(
        `Unable to format date '${date}' to locale '${locale}' with opts "${JSON.stringify(opts)}".`,
      );
      // throw e;
      return "";
    }
  });

  // markdownify
  eleventyConfig.addFilter("markdownify", function (value) {
    const md = markdownIt();
    return md.render(value);
  });

  eleventyConfig.addFilter("required", function (value, errorMessage) {
    if (!value) {
      throw new Error(errorMessage || "Missing required argument in template");
    }
    return value;
  });

  // Get translated stringsˆ
  eleventyConfig.addFilter("t", function (key, locale) {
    // Access the Liquid context's environment
    const env = this.context.environments;
    if (!locale) {
      // Fallback to a default language if 'locale' is not provided
      locale = env.locale || siteConfig.defaultLocale;
    }
    const localeData = env.i18n[locale];
    // throw new Error(Object.keys(localeData));
    return localeData
      ? localeData[key] || `MISSING_TRANSLATION_${key}`
      : `MISSING_LOCALE_${locale}`;
  });

  // Global computed data for blog post permalinks and locale
  eleventyConfig.addGlobalData("eleventyComputed", {
    fileDirectoryStem: (data) => {
      const { filePathStem } = data.page;
      return path.dirname(filePathStem);
    },
    layout: (data) => {
      const { filePathStem } = data.page;
      console.log(`Layout '${data.layout}' for page '${filePathStem}'`);

      if (data.layout === "") {
        // if (filePathStem.startsWith("/pages/")) {
        //     return "layouts/page.html";
        // }
        if (filePathStem.startsWith("/posts/")) {
          return "layouts/post.html";
        }
      }

      return data.layout;
    },
    locale: (data) => {
      const { filePathStem } = data.page;
      console.log(
        `Resolving locale for page '${filePathStem}' with layout '${data.layout}'.`,
      );

      if (
        !(
          filePathStem.startsWith("/pages/") ||
          filePathStem.startsWith("/posts/")
        )
      ) {
        return null;
      }

      const match = filePathStem.match(/\.([\w-]+)$/);
      if (match) {
        const locale = match[1];
        console.log(`Resolved locale '${locale}' for page '${filePathStem}'.`);
        return locale;
      }
      throw new Error(
        `Unable to resolve locale for page '${filePathStem}'. Looks like your file name does not ends with locale.`,
      );
    },
    locales: (data) => {
      const { page } = data;
      const { filePathStem } = page;

      if (!filePathStem) {
        return {};
      }

      if (filePathStem.startsWith("/posts/")) {
        // Only apply to blog posts: src/posts/2025/2025-01-15-hello-world/...
        console.log("Resolving locales for /posts");
        const match = filePathStem.match(
          /^(\/posts\/\d{4}\/\d{4}-\d{2}-\d{2}-[\w-]+\/[\w-]+)\.[\w-]+$/,
        );
        if (match) {
          const slug = match[1];
          translationPages = data.collections.all.filter((p) =>
            p.filePathStem.startsWith(slug),
          );
          const map = {};
          for (const translationPage of translationPages) {
            map[translationPage.data.locale] = translationPage.data.permalink;
          }
          console.log("Resolve locales", filePathStem, JSON.stringify(map));
          return map;
        } else {
          return {};
        }
      } else if (filePathStem.startsWith("/pages/")) {
        // Only apply to blog posts: /pages/slug/...
        const match = filePathStem.match(/^(\/pages\/[\w-]+\/[\w-]+)\.[\w-]+$/);
        if (match) {
          const slug = match[1];
          translationPages = data.collections.all.filter((p) =>
            p.filePathStem.startsWith(slug),
          );
          const map = {};
          for (const translationPage of translationPages) {
            map[translationPage.data.locale] = translationPage.data.permalink;
          }
          console.log("Resolve locales", filePathStem, JSON.stringify(map));
          return map;
        } else {
          return {};
        }
      } else {
        return {};
      }
    },
    permalink: (data) => {
      const { page } = data;
      const { filePathStem, fileSlug } = page;

      if (
        !(
          filePathStem.startsWith("/pages/") ||
          filePathStem.startsWith("/posts/")
        )
      ) {
        console.log(
          `Use default permalink '${data.permalink}' for page '${filePathStem}'`,
        );
        return data.permalink;
      }

      const { locale } = data;

      if (locale === null || locale === undefined || locale === "") {
        // Eleventy evaluate this property several times,
        // so we have to skip evaluation if locale is not presented yet
        console.log(`Resolve permalink 'null' for page '${filePathStem}'`);
        return null;
      }

      if (filePathStem) {
        if (filePathStem.startsWith("/posts/")) {
          // Only apply to blog posts: src/posts/2025/2025-01-15-hello-world/...
          const match = filePathStem.match(
            /\/posts\/\d{4}\/(\d{4})-(\d{2})-(\d{2})-([\w-]+)\//,
          );
          if (match) {
            const year = match[1];
            const month = match[2];
            const day = match[3];
            const slug = match[4];
            const permalink = `/${locale}/blog/${year}/${month}/${slug}/`;
            console.log(
              `Resolve posts permalink '${permalink}' for page '${filePathStem}'`,
            );
            return permalink;
          }
        } else if (filePathStem.startsWith("/pages/")) {
          // Only apply to blog posts: /pages/slug/...
          const match = filePathStem.match(/\/pages\/([\w-]+)\//);
          if (match) {
            const slug = match[1];
            if (slug === "index") {
              const permalink = `/${locale}/`;
              console.log(
                `Resolve pages index permalink '${permalink}' for page '${filePathStem}'`,
              );
              return permalink;
            } else {
              const expectedFileSlug = `${slug}.${locale}`;
              if (fileSlug != expectedFileSlug) {
                throw new Error(
                  `Unable to format permalink for page '${filePathStem}', locale: '${locale}'. Reason: not relevant fileSlug '${fileSlug}', expected fileSlug is '${expectedFileSlug}'. Pls rename file or directory to continue.`,
                );
              }

              const permalink = `/${locale}/${slug}/`;
              console.log(
                `Resolve pages permalink '${permalink}' for page '${filePathStem}'`,
              );
              return permalink;
            }
          }
        }
      }
      throw new Error(
        `Unable to resolve permalink for page '${filePathStem}', locale: '${locale}'`,
      );
    },
  });

  // (current year provided via data file)

  eleventyConfig.addCollection("posts", (collectionApi) => {
    const allPostMarkdowns = [];

    const locales = Object.keys(siteConfig.locales);
    for (const path of locales.map(
      (locale) => `src/posts/*/*/*.${locale}.md`,
    )) {
      const posts = collectionApi
        .getFilteredByGlob(path)
        .filter((p) => !p.data.draft);
      for (const post of posts) {
        allPostMarkdowns.push(post);
      }
    }

    const map = {};
    for (const postMarkdown of allPostMarkdowns) {
      const { fileSlug, filePathStem } = postMarkdown;

      const [slug, locale] = fileSlug.split(".");

      const match = filePathStem.match(
        /\/posts\/\d{4}\/(\d{4})-(\d{2})-(\d{2})-([\w-]+)\//,
      );
      if (!match) {
        // TODO: Log error
        continue;
      }

      if (slug !== match[4]) {
        // TODO: Log error
        continue;
      }

      const year = match[1];
      const month = match[2];
      const day = match[3];

      if (!map[filePathStem]) map[filePathStem] = {};

      map[filePathStem]["postDate"] = `${year}-${month}-${day}`;
      map[filePathStem][locale] = postMarkdown;
    }

    const slugs = Object.keys(map);
    slugs.sort((a, b) => b.localeCompare(a));

    const collectionItems = slugs.map((slug) => ({
      ...map[slug],
      slug,
    }));

    console.log("slugs", JSON.stringify(slugs));
    // console.log("allDict", JSON.stringify(all.map(p => Object.keys(p))));
    // console.log("all", JSON.stringify(all.map(p => p.fileSlug)));

    return collectionItems;
  });

  eleventyConfig.setFrontMatterParsingOptions({
    excerpt: true,
    excerpt_separator: "<!-- excerpt -->",
  });

  return {
    dir: {
      input: "src",
      output: "dist",
      includes: "_includes",
      data: "_data",
    },
    templateFormats: ["liquid", "md", "html"],
    // templateFormats: ["liquid"],
    markdownTemplateEngine: "liquid",
    htmlTemplateEngine: "liquid",
  };
};

function capitalizeWord(word) {
  if (word.length === 0) {
    return ""; // Handle empty strings
  }
  const firstLetter = word.charAt(0).toUpperCase();
  const restOfWord = word.slice(1);
  return firstLetter + restOfWord;
}

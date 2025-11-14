const path = require("path");
const fs = require("fs");
const toml = require("@iarna/toml");
const yaml = require("js-yaml");
const sass = require("sass");
const { HtmlBasePlugin, UserConfig } = require("@11ty/eleventy");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const pluginSitemap = require("@quasibit/eleventy-plugin-sitemap");

const siteConfig = {
    // url: "https://example.com/", // Your site's base URL
    support_dark_mode: true,
}

const POST_FILE_PATH_STEM_REGEX = /^\/posts\/(\d{4})\/\d+-([\w-]+)\/\w+$/;

/**
 * @param {UserConfig} eleventyConfig
 */
module.exports = function (eleventyConfig) {
    eleventyConfig.addGlobalData("site", {
        ...siteConfig,
    });

    eleventyConfig.addPlugin(HtmlBasePlugin);

    // // Collections by locale (files now in subdirectories: /uk.md, /en.md)
    // eleventyConfig.addCollection("posts_uk", (collectionApi) =>
    //     collectionApi.getFilteredByGlob("src/posts/*/*/uk.md").filter((p) => !p.data.draft)
    // );

    // eleventyConfig.addCollection("posts_en", (collectionApi) =>
    //     collectionApi.getFilteredByGlob("src/posts/*/*/en.md").filter((p) => !p.data.draft)
    // );


    // Lower priority
    eleventyConfig.addDataExtension("yml", (contents) => yaml.load(contents));
    // Higher priority
    eleventyConfig.addDataExtension("toml", (contents) => toml.parse(contents));


    // Passthrough (keep existing assets where they are)
    eleventyConfig.addPassthroughCopy({ "assets": "assets" });

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
                loadPaths: [
                    parsed.dir || ".",
                    this.config.dir.includes,
                ]
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
    if (typeof eleventyConfig.configureErrorReporting === 'function') {
        eleventyConfig.configureErrorReporting({ allowMissingExtensions: true });
    }

    // Date formatting
    eleventyConfig.addFilter("dateLocale", (date, locale = "uk-UA", opts = {}) =>
        new Intl.DateTimeFormat(locale, { dateStyle: "medium", ...opts }).format(new Date(date))
    );

    // Global computed data for blog post permalinks and lang
    eleventyConfig.addGlobalData("eleventyComputed", {
        layout: (data) => data.layout || "layouts/post.html",
        lang: (data) => {
            const { filePathStem } = data.page;
            // console.log(`Resolving lang for page '${filePathStem}'.`);

            if (!(filePathStem.startsWith("/pages/") || filePathStem.startsWith("/posts/"))) {
                return null;
            }

            const match = filePathStem.match(/\.([\w-]+)$/);
            if (match) {
                const lang = match[1];
                console.log(`Resolved lang '${lang}' for page '${filePathStem}'.`);
                return lang;
            }
            throw new Error(`Unable to resolve lang for page '${filePathStem}'. Looks like your file name does not ends with lang-code.`);
        },
        permalink: (data) => {
            const { page } = data;
            const { filePathStem } = page;

            if (!(filePathStem.startsWith("/pages/") || filePathStem.startsWith("/posts/"))) {
                console.log(`Resolve permalink '${data.permalink}' for page '${filePathStem}'`)
                return data.permalink;
            }

            const { lang } = data;

            if (lang === null || lang === undefined || lang === "") {
                // Eleventy evaluate this property several times,
                // so we have to skip evaluation if lang is not presented yet
                return null;
            }

            if (filePathStem) {
                if (filePathStem.startsWith("/posts/")) {
                    // Only apply to blog posts: src/posts/2025/2025-01-15-hello-world/...
                    const match = filePathStem.match(/\/posts\/\d{4}\/(\d{4})-(\d{2})-(\d{2})-([\w-]+)\//);
                    if (match) {
                        const year = match[1];
                        const month = match[2];
                        const day = match[3];
                        const slug = match[4];
                        return `/${lang}/blog/${year}/${month}/${slug}/`;
                    }
                } else if (filePathStem.startsWith("/pages/")) {
                    // Only apply to blog posts: /pages/slug/...
                    const match = filePathStem.match(/\/pages\/([\w-]+)\//);
                    if (match) {
                        const slug = match[1];
                        if (slug === "index") {
                            return `/${lang}/`;
                        } else {
                            return `/${lang}/${slug}/`;
                        }
                    }
                }
            }
            throw new Error(`Unable to resolve permalink for page '${filePathStem}', lang: '${lang}'`);
        }
    });

    // (current year provided via data file)

    // // Index posts by slug for lang switching (files in subdirectories)
    // eleventyConfig.addCollection("bySlug", (collectionApi) => {
    //     const all = [
    //         ...collectionApi.getFilteredByGlob("src/posts/*/*/uk.md"),
    //         ...collectionApi.getFilteredByGlob("src/posts/*/*/en.md"),
    //     ].filter((p) => !p.data.draft);

    //     const map = {};
    //     for (const p of all) {
    //         const slug = p.data.slug;
    //         const lang = p.data.lang;
    //         if (!slug) continue;
    //         if (!map[slug]) map[slug] = {};
    //         map[slug][lang] = p;
    //     }
    //     return map;
    // });


    //
    // Extend Liquid by some Jekyll-friendly filters
    //
    eleventyConfig.addLiquidFilter("capitalize_all", function (words) {
        return words.split(' ').map(capitalizeWord).join(' ');
    });

    return {
        dir: { input: "src", output: "dist", includes: "_includes", data: "_data" },
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

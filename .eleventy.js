const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const truncateHtml = require("truncatise");

module.exports = function (eleventyConfig) {
  let markdownIt = require("markdown-it")
  let options = {
    html: true
  };
  let markdownLib = markdownIt(options);

  eleventyConfig.setLibrary("md", markdownLib);

  eleventyConfig.addPlugin(syntaxHighlight);

  eleventyConfig.addPassthroughCopy("src/static");

  eleventyConfig.addLiquidFilter("truncateHtml", function (html, paragraphs) {
    var options = {
      TruncateLength: parseInt(paragraphs) || 5,
      TruncateBy: "paragraphs",
      Strict: false,
      StripHTML: false,
      Suffix: ''
    };
    return truncateHtml(html, options);
  });

  eleventyConfig.addCollection("homepage", function (collection) {
    return collection.getAllSorted().filter(function(item) {
      var tags = item.data.tags || [];
      return (tags.includes("post") || tags.includes("article")) && !tags.includes("draft");
    });
  });

  eleventyConfig.addCollection("article", function (collection) {
    return collection.getAllSorted().filter(function(item) {
      var tags = item.data.tags || [];
      return tags.includes("article") && !tags.includes("draft");
    });
  });

  eleventyConfig.addCollection("post", function (collection) {
    return collection.getAllSorted().filter(function(item) {
      var tags = item.data.tags || [];
      return tags.includes("post") && !tags.includes("draft");
    });
  });

  return {
    dir: {
      input: "src",
      output: "dist",
      includes: "_includes",
      layouts: "_layouts"
    }
  };
};
const { DateTime } = require("luxon");

module.exports = function(eleventyConfig) {
  
  eleventyConfig.addFilter("readableDate", dateObj => {
    return DateTime.fromJSDate(dateObj, {zone: "Europe/London"}).toFormat("dd LLLL yyyy");
  });

  eleventyConfig.addFilter("readableTime", dateObj => {
    return DateTime.fromJSDate(dateObj, {zone: "Europe/London"}).toFormat("HH:mm");
  });

  eleventyConfig.addFilter("isoDate", dateObj => {
    return DateTime.fromJSDate(dateObj, {zone: "Europe/London"}).toISO();
  });

  return {
    markdownTemplateEngine: 'njk',
    dataTemplateEngine: 'njk',
    htmlTemplateEngine: 'njk',
    dir: {
      input: "src",
      output: "dist",
      layouts: "layouts",
    }
  }
}
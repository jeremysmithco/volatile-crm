const colors = require("tailwindcss/colors");

module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/views/**/*.rb",
    "./app/helpers/**/*.rb",
    "./app/components/**/*.erb",
    "./app/components/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
  ],
}

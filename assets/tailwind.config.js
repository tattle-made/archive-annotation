// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");
const fs = require("fs");
const path = require("path");
const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/kosh_web.ex",
    "../lib/kosh_web/**/*.*ex",
    "../lib/kosh_web/**/*.heex",
    "../lib/kosh_web/**/*.html",
    "../deps/live_select/lib/live_select/component.*ex",
    "../deps/live_select/lib/**/*.ex",    
    "../deps/live_select/lib/**/*.heex"
  ],
  // theme: {
  //   extend: {
  //     colors: {
  //       brand: "#FD4F00",
  //     }
  //   },
  // },
  theme: {
    extend: {
      colors: {
        /* Primary */
        "primary-purple": "#8c4673",
        "primary-black": "#090420",
        "primary-grey": "#7b7882",
        "primary-white": "#ffffff",

        /* Secondary */
        "secondary-purple": "#592d49",
        "secondary-pale-grey": "#dcd9db",
        "secondary-lilac": "#e6e9f5",
        "secondary-lime": "#f7ffe2",
        "secondary-blue": "#d7e7ff",
        "secondary-grey": "#4c464f",

        /* Backgrounds */
        "bg-lilac": "#eeeff5",
        "bg-grey": "#e4e5eb",
      },

      boxShadow: {
        /* Milli Shadow 1 */
        "milli-1": "0px 4px 4px 0px #00000040",
      },

      fontFamily: {
        // make Noto Sans the primary sans, but fall back
        // through all the usual defaults too
        sans: ["Noto Sans", ...defaultTheme.fontFamily.sans],
        /* Noto Sans */
        noto: ["Noto Sans", "sans-serif"],
      },

      fontSize: {
        /* px → rem (16px base), with line-height objects */
        "display-40": ["2.5rem", { lineHeight: "3.25rem" }], // 40px + LH 52px
        "body-lg-24": ["1.5rem", { lineHeight: "2.125rem" }], // 24px + LH 34px // Tailwind text-2xl has 24px/32px LH
        "body-md-18": ["1.125rem", { lineHeight: "1.6875rem" }], // 18px + LH 27px
        "body-sm-16": ["1rem", { lineHeight: "1.5rem" }], // 16px + LH 24px  // Same as Tailwind default text-base class. When nothing is mentioned, it automatically gets applied
        "caption-14": ["0.875rem", { lineHeight: "1.3125rem" }], // 14px + LH 21px
        "meta-12": ["0.75rem", { lineHeight: "1.125rem" }], // 12px + LH 18px
        "heading-28": ["1.75rem", { lineHeight: "2.5rem" }],   // 28/40
      },

      lineHeight: {
        /* Extra named LHs if you need them standalone */
        "lh-52": "3.25rem",
        "lh-40": "2.5rem",
        "lh-34": "2.125rem",
        "lh-27": "1.6875rem",
        "lh-24": "1.5rem",
        "lh-21": "1.3125rem",
        "lh-18": "1.125rem",
      },
    },
  },
  plugins: [
    function ({ addComponents, theme }) {
      addComponents({
        ".section-gutter > *": {
          paddingLeft: theme("spacing.4"),
          paddingRight: theme("spacing.4"),
          "@screen sm": {
            paddingLeft: theme("spacing.6"),
            paddingRight: theme("spacing.6"),
          },
          "@screen lg": {
            paddingLeft: theme("spacing.8"),
            paddingRight: theme("spacing.8"),
          },
          "@screen xl": {
            paddingLeft: theme("spacing.52"),
            paddingRight: theme("spacing.52"),
          },
        },
      });
    },
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [
        ".phx-click-loading&",
        ".phx-click-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [
        ".phx-submit-loading&",
        ".phx-submit-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [
        ".phx-change-loading&",
        ".phx-change-loading &",
      ])
    ),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized");
      let values = {};
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"],
      ];
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach((file) => {
          let name = path.basename(file, ".svg") + suffix;
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
        });
      });
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");
            let size = theme("spacing.6");
            if (name.endsWith("-mini")) {
              size = theme("spacing.5");
            } else if (name.endsWith("-micro")) {
              size = theme("spacing.4");
            }
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: size,
              height: size,
            };
          },
        },
        { values }
      );
    }),
  ],
};

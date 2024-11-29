export default {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        avenir: ['"Avenir", sans-serif'],
        manrope: ['"Manrope", serif'],
        merriweather: ['"Merriweather", serif'],
      },
      colors: {
        primarySunset: '#ff461e', // sunset
        primaryHibiscus: '#f8285f',
        secondarySummer: '#93c2c6',
        secondarySage: '#93c393',
        secondaryPlum: '#2f1c54',
        secondaryCharcoal: '#161616',
      },

      backgroundImage: {
        primaryGradientOne: 'linear-gradient(to right, #ff461e, #f8285f)',
        primaryGradientTwo: 'linear-gradient(to right, #ff461e, #2f1c54)',
        secondaryGradientOne: 'linear-gradient(to right, #f8285f, #2f1c54)',
        secondaryGradientTwo: 'linear-gradient(to right, #161616, #93c393)',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
};

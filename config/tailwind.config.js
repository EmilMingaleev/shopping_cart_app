module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        'primary-500': '#FF0000', // Замените на цвет из Figma
        'light-gray-300': '#F0F0F0', // Замените на цвет из Figma
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'], // Используйте шрифт из Figma
      },
    },
  },
  plugins: [],
}
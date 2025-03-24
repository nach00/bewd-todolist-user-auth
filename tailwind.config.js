module.exports = {
	content: [
		"./app/views/**/*.html.erb",
		"./app/helpers/**/*.rb",
		"./app/javascript/**/*.js",
	],
	theme: {
		extend: {
			fontFamily: {
				sans: ["Helvetica", "Arial", "sans-serif"],
			},
		},
	},
	plugins: [],
};

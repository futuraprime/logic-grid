require.config
	baseUrl : "js"
	paths :
		underscore : "libraries/underscore"
		serenade : 'libraries/serenade'
		templates : '../templates'
		text : 'libraries/text'
	shim:
		underscore:
			exports: '_'
		serenade:
			exports: 'Serenade'

require ['app'], (App) ->
	a = new App()


require.config
	baseUrl : "js"
	paths :
		serenade : 'lib/serenade'
		underscore : 'lib/underscore-min'
		templates : '../templates'
		text : 'lib/text'
	shim:
		underscore:
			exports: '_'
		serenade:
			exports: 'Serenade'

require ['app/app'], (App) ->
	a = new App()

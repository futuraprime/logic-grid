require.config
	baseUrl : "js"
	paths :
		serenade : 'lib/serenade'
		underscore : 'lib/underscore-min'
		templates : '../templates'
		text : 'lib/text'
		jquery: 'lib/jquery-1.8.3.min'
	shim:
		underscore:
			exports: '_'
		serenade:
			exports: 'Serenade'
		jquery:
			exports: 'jQuery'

require ['app/app'], (App) ->
	a = new App()

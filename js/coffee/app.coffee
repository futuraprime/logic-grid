define [
	'underscore', 'serenade', 'app/models/Group', 'app/controllers/SizingController', 'app/views/SizingView'
], (_, Serenade, Group, SizingController, SizingView) ->
	class App extends Serenade.Model
		@property 'groups'
		@property 'itemsPerGroup'
		@localStorage = true

		constructor : ->
			console.log "starting up"
			@element = document.getElementById 'interactive'

			# defaults
			@groups = 2
			@itemsPerGroup = 2

			@sizing = SizingView.render @, SizingController
			@element.appendChild @sizing





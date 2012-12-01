define [
	'underscore',
	'serenade',
	'app/models/Group',
	'app/controllers/SizingController',
	'app/views/SizingView',
	'app/views/GridView'
], (_, Serenade, Group, SizingController, SizingView, GridView) ->
	class App extends Serenade.Model
		@hasMany 'groups'
			as: -> Group
			dependsOn : 'numGroups'
		@collection 'topGroups',
			# get : -> @groups.slice(1, @numGroups)
			dependsOn : 'groups'
		@collection 'sideGroups'
			# get : -> @groups.slice(0, @numGroups - 1)
			dependsOn : 'groups'

		@property 'numGroups',
			set : (value) ->
				console.log "setting numGroups", value
				len = @groups.length
				if value > len
					@groups.push new Group for n in [len..(value - 1)]
				if value < len
					@groups = @groups.splice(0, value)

				@topGroups = @groups.slice(1, value)
				@sideGroups = @groups.slice(0, value-1)

				@attributes.numGroups = value
 		@property 'itemsPerGroup'
		@localStorage = true

		constructor : ->
			console.log "starting up"
			window.app = @
			window.Serenade = Serenade
			@element = document.getElementById 'interactive'

			@groups = []

			# defaults
			@numGroups = 2
			@itemsPerGroup = 2

			@sizing = SizingView.render @, SizingController
			@element.appendChild @sizing

			@grid = GridView.render @
			@element.appendChild @grid


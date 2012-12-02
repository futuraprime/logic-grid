define [
	'underscore',
	'serenade',
	'app/models/Group',
	'app/controllers/SizingController',
	'app/controllers/GridController',
	'app/views/Views'
], (_, Serenade, Group, SizingController, GridController, Views) ->
	class App extends Serenade.Model
		@hasMany 'groups'
			as: -> Group
			dependsOn : 'numGroups'
		@collection 'topGroups',
			dependsOn : 'groups'
		@collection 'sideGroups'
			dependsOn : 'groups'

		@property 'numGroups',
			set : (value) ->
				console.log "setting numGroups", value
				len = @groups.length
				if value > len
					@groups.push new Group(@itemsPerGroup) for n in [len..(value-1)]
				if value < len
					@groups = @groups.splice 0, value

				@topGroups = @groups.slice 1, value
				@sideGroups = @groups.slice 0, value-1

				@attributes.numGroups = value
				value
 		@property 'itemsPerGroup',
 			set : (value) ->
 				group.numItems = value for group in @groups
 				@attributes.itemsPerGroup = value
 				value
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

			@sizing = Serenade.render 'SizingView', @, SizingController
			@element.appendChild @sizing

			@grid = Serenade.render 'GridView', @, GridController
			@element.appendChild @grid


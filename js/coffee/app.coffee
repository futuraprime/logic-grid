define [
	'underscore',
	'jquery',
	'serenade',
	'app/models/Group',
	'app/controllers/SizingController',
	'app/controllers/GridController',
	'app/controllers/ItemTitleController'
	'app/views/Views'
], (_,
	$,
	Serenade,
	Group,
	SizingController,
	GridController,
	ItemTitleController,
	Views
) ->
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
				len = @groups.length
				if value > len
					@groups.push new Group(@itemsPerGroup) for n in [len..(value-1)]
				if value < len
					@groups = @groups.splice 0, value

				@topGroups = @groups.slice 1, value
				@sideGroups = @groups.slice 0, value-1

				@attributes.numGroups = value

				@update()
				value
 		@property 'itemsPerGroup',
 			set : (value) ->
 				group.numItems = value for group in @groups
 				@attributes.itemsPerGroup = value

 				@update()
 				value
		@localStorage = true

		constructor : ->
			console.log "starting up"
			window.app = @
			window.Serenade = Serenade
			window.linksBuilt = 0
			window.itemIdTicker = 0
			@element = document.getElementById 'interactive'

			# defaults
			@itemsPerGroup = 2
			@numGroups = 2

			@sizing = Serenade.render 'SizingView', @, SizingController
			@element.appendChild @sizing

			@grid = Serenade.render 'GridView', @, GridController
			@element.appendChild @grid

		update : ->
			group.updateLinks(@groups) for group in @groups

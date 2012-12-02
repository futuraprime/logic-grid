define ['serenade'], (Serenade) ->
	class ItemTitleController
		constructor : (@model) ->
			@editing = false

		changed : (item) ->
			target = event.target
			@model.set target.getAttribute('name'), target.value

	Serenade.controller 'GroupTitlesSide', ItemTitleController
	Serenade.controller 'GroupTitlesTop', ItemTitleController

	ItemTitleController

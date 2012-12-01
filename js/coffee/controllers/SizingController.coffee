define ['serenade'], (Serenade) ->
	class SizingController
		min : 2
		max : 8

		constructor : (@model) ->

		changed : (a) ->
			target = event.target
			@model.set target.getAttribute('name'), @_rangeCheck +target.value
			console.log "changed!", target.getAttribute('name'), @_rangeCheck target.value
			console.log a

		_rangeCheck : (value) ->
			if value < @min
				@min
			else if value > @max
				@max
			else
				value


define ['serenade'], (Serenade) ->
	class SizingController
		constructor : (@model) ->
		changed : ->
			target = event.target
			console.log "changed!", target.getAttribute('name'), target.value

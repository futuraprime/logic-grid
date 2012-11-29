define [
	'underscore', 'serenade', 'app/models/Group'
], (_, Serenade, Group) ->
	class App extends Serenade.Model
		@property 'groups'
		@property 'itemsPerGroup'

		constructor : ->
			console.log "starting up"


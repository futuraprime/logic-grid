define ['serenade', 'app/models/Link'], (Serenade, Link) ->
	class Item extends Serenade.Model
		@property 'name'
		# @property 'id'
		@belongsTo 'group'
			inverseOf: 'items'
		@hasMany 'links'
			as : -> Link
			serialize: true
		@property 'linked',
			get: ->
				link.otherItem(@) for link in @links

		constructor : ->
			@id = ++itemIdTicker

		createLink : (item) ->
			console.log 'linking', @.id, 'and', item.id
			@links.push new Link @, item

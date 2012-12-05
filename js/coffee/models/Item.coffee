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

		updateLinks : (group) ->
			if group.items
				for item in group.items
					@setLink item

		setLink : (item) ->
			console.log 'setting link between', @.id, item.id, (i.id for i in item.linked), @
			if @ in item.linked
				console.log 'we are linked'
				return
			@links.push new Link @, item

			window.linksBuilt += 1

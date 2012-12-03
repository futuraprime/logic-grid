define ['serenade', 'app/models/Link'], (Serenade, Link) ->
	class Item extends Serenade.Model
		@property 'name'
		@belongsTo 'group'
			inverseOf: 'items'
		@hasMany 'links'
			# inverseOf: 'items'
			as : -> Link
			serialize: true
		@property 'linked',
			get: ->
				link.otherItem(@) for link in @links

		constructor : ->

		updateLinks : (group) ->
			# console.log 'item', @, 'group', group

			if group.items
				for item in group.items
					@setLink item

		setLink : (item) ->
			# console.log 'setting link between', @, item
			if @ in item.linked
				# console.log 'we are linked'
				return
			@links.push new Link(@, item)

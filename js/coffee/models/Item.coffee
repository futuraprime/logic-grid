define ['serenade', 'app/models/Link'], (Serenade, Link) ->
	class Item extends Serenade.Model
		@property 'name'
		@hasMany 'links'
			inverseOf: 'item'
			as : (-> Link)
			serialize: true
		@property 'linked',
			get: ->
				link.otherItem(@) for link in @links

		constructor : ->

		updateLinks : (groups) ->
			# console.log 'link', @links

			for group in groups
				# console.log 'group', group
				if group.items
					for item in group.items
						@setLink item

		setLink : (item) ->
			console.log 'linked', @links, @linked, @, @ in @linked, item in @linked
			if @ in item.linked
				console.log 'we are linked'
				return
			@links.push new Link(@, item)

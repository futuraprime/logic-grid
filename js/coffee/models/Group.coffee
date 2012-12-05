define ['serenade', 'app/models/Item'], (Serenade, Item) ->
	class Group extends Serenade.Model
		@property 'numItems',
			set : (value) ->
				len = @items.length
				if value > len
					@items.push new Item for n in [len..(value-1)]
				if value < len
					@items = @items.splice 0, value
				# I think this is a bug in Serenade, but until I can confirm that...
				# we can just trim what shouldn't be there anyway.
		@hasMany 'items', 
			as : -> Item
			# for some reason this makes everything go nuts...
			# inverseOf : 'group' 

		constructor : (@numItems) ->

		updateLinks: (groups) ->
			otherGroups = (group for group in groups when group != @)

			for group in otherGroups
				item.updateLinks(group) for item in @items

define ['serenade', 'app/models/Item'], (Serenade, Item) ->
	class Group extends Serenade.Model
		@property 'numItems',
			set : (value) ->
				len = @items.length
				if value > len
					console.log 'pushing new items!!!'
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
			@id = ++groupIdTicker

		createLinks : (group) ->
			links = []
			for item in @items
				console.log 'iterating primary items', item.id
				for i in group.items
					console.log 'iterating secondary items', i.id
					item.createLink i
				# console.log item.id, item, ("[#{link.primaryItemId}, #{link.secondaryItemId}]" for link in item.links)

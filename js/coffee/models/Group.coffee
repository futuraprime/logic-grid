define ['serenade', 'app/models/Item'], (Serenade, Item) ->
	class Group extends Serenade.Model
		@property 'numItems',
			set : (value) ->
				console.log "setting items on stuff", value
				len = @items.length
				if value > len
					@items.push new Item for n in [len..(value-1)]
				if value < len
					@items = @items.splice 0, value
		@hasMany 'items', 
			as : (-> Comment)
			serialize : true

		constructor : (@numItems) ->

		updateLinks: (groups) ->
			otherGroups = (group for group in groups when group != @)

			item.updateLinks(otherGroups) for item in @items

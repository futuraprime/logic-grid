define ['serenade', 'app/models/item'], (Serenade, Item) ->
	class Link extends Serenade.Model
		@property 'valid'
		@belongsTo 'primaryItem',
			serialize: true
		@belongsTo 'secondaryItem',
			serialize: true
		@property 'items',
			get : ->
				[@primaryItem, @secondaryItem]
		@property 'primaryItemId',
			get : ->
				if @primaryItem then @primaryItem.id else ""
		@property 'secondaryItemId',
			get : ->
				if @secondaryItem then @secondaryItem.id else ""

		constructor : (@primaryItem, @secondaryItem) ->
			++linksBuilt
			console.log 'created link between', @primaryItem.id, @secondaryItem.id

		otherItem : (item) ->
			# console.log 'otherItem', @, item, @ == item, (i for i in @items when i isnt item)
			if item == @primaryItem
				@primaryItem
			else if item == @secondaryItem
				@secondaryItem
			else
				false

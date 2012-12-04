define ['serenade', 'app/models/item'], (Serenade, Item) ->
	class Link extends Serenade.Model
		@property 'valid'
		@belongsTo 'primaryItem',
			inverseOf : 'links'
			serialize: true
		@belongsTo 'secondaryItem',
			inverseOf : 'links'
			serialize: true
		@property 'items',
			get : ->
				return [@primaryItem, @secondaryItem]

		constructor : (@primaryItem, @secondaryItem) ->
			# console.log 'created link between', item1, item2, @items

		otherItem : (item) ->
			# console.log 'otherItem', @, item, @ == item, (i for i in @items when i isnt item)
			(i for i in @items when i isnt item)[0]


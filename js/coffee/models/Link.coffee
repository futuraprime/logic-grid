define ['serenade', 'app/models/item'], (Serenade, Item) ->
	class Link extends Serenade.Model
		@property 'valid'
		@hasMany 'items',
			inverseOf : 'links'
			as : -> Item

		constructor : (item1, item2) ->
			@items.push(item1)
			@items.push(item2)

		otherItem : (item) ->
			console.log 'otherItem', @, item, (i for i in @items when i isnt item)
			(i for i in @items when i isnt item)[0]


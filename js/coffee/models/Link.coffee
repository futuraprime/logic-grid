define ['serenade', 'app/models/item'], (Serenade, Item) ->
	class Link extends Serenade.Model
		@property 'valid'
		@hasMany 'items',
			inverseOf : 'links'
			as : (-> Item)

		constructor : (item1, item2) ->
			@items[0] = item1
			@items[1] = item2

		otherItem : (item) ->
			[i for i in @items if i is not item][0]

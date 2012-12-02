define ['serenade'], (Serenade) ->
	class Item extends Serenade.Model
		@property 'name'

		constructor : ->
			@name = 'new item'

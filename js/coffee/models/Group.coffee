define ['serenade', 'app/models/Item'], (Serenade, Item) ->
	class Group extends Serenade.Model
		@hasMany 'items', 
			as : (-> Comment)
			serialize : true

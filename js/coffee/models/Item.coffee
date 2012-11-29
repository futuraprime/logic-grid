define ['serenade', 'app/models/Link'], (Serenade, Link) ->
	class Item extends Serenade.Model
		@property 'name'
		@hasMany 'links',
			as : (-> Link)
			serialize: true

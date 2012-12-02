define [
	'serenade',
	'text!templates/sizingForm.tmpl',
	'text!templates/grid.tmpl',
	'text!templates/groupTitlesSide.tmpl',
	'text!templates/groupTitlesTop.tmpl'
], (
	Serenade,
	sizingViewTmpl,
	gridTmpl,
	groupTitlesSideTmpl,
	groupTitlesTopTmpl
) ->
	views = {}

	views.SizingView = Serenade.view 'SizingView', sizingViewTmpl
	views.GridView = Serenade.view 'GridView', gridTmpl
	views.GroupTitlesSide = Serenade.view 'GroupTitlesSide', groupTitlesSideTmpl
	views.GroupTitlesTop = Serenade.view 'GroupTitlesTop', groupTitlesTopTmpl

	views

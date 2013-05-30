Bsh.Route = Em.Route.extend
  activate: (router, context) ->
    @_super()

    $('.dropdown').hide()
    $('header ul.icons li').removeClass('active')
    $('[data-toggle="dropdown"]').parent().removeClass('open')

    hideDropDownFunction = $('html').data('hide-dropdown')
    if hideDropDownFunction then return hideDropDownFunction()

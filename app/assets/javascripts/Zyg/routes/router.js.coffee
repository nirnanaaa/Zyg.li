Zyg.Route = Em.Route.extend
  activate: (router, context) ->
    @_super()

    $('.dropdown').hide()
    $('header ul.icons li').removeClass('active')
    $('[data-toggle="dropdown"]').parent().removeClass('open')

    hideDropDownFunction = $('html').data('hide-dropdown')
    if hideDropDownFunction then return hideDropDownFunction()


Zyg.Route.reopenClass
    buildRoutes: (builder) ->
      oldBuilder = Zyg.routeBuilder
      Zyg.routeBuilder = ->
        if (oldBuilder) oldBuilder.call(@)
          return builder.call(@)


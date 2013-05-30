Bsh.URL =
  MORE_REGEXP: /\/more$/,
  router: ->
    return Bsh.__container__.lookup('router:main')

  replaceState: (path) ->

    if window.history && window.history.pushState && window.history.replaceState && (window.location.pathname != path)
      Em.run.next ->
        Bsh.URL.router().get('location').replaceURL(path)

  routeTo: (path) ->
    currentPath = window.location.pathname
    path = path.replace(/https?\:\/\/[^\/]+/, '')


    if @MORE_REGEXP.exec(currentPath) && (currentPath.indexOf(path) == 0)
      window.scrollTo(0, 0)

    router = @router()
    router.router.updateURL path
    return router.handleURL path

  origin: ->
    return window.location.origin

  redirectTo: (url) ->
    window.location = Bsh.getURL(url)

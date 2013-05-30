Bsh = Ember.Application.createWithMixins
  LOG_TRANSITIONS: true
  authStateBinding: 'auth.State'
  
  rootElement: '#root'
  hasFocus: true
  scrolling: false

  signedIn: (-> @get('authState') == 'signed-in' ).property('authState')
  
  currentDate: ->
    new Date()

  setLocale: (locale) ->
    return unless locale
    I18n.locale = locale
    Bsh.set('locale', locale)

  defaultLocale: 'en'
  loadDomEvents: ->
    $html = $('html')

    $(window).focus (->
      Bsh.set 'hasFocus', true
      Bsh.set 'notify', false
    ).blur ->
      Bsh.set 'hasFocus', false

    csrfToken = $('meta[name=csrf-token]').attr('content')
    $.ajaxPrefilter (options, originalOptions, xhr) ->
      if !options.crossDomain
        xhr.setRequestHeader 'X-CSRF-Token', csrfToken

    $('#root').on 'click', 'a', (e) ->
      if (e.isDefaultPrevented() || e.shiftKey || e.metaKey || e.ctrlKey)
        return

      currentTarget = $(e.currentTarget)
      href = target.attr('href')
      if !href then return
      if href == '#' then return
      if target.attr 'target' then return
      
      if target.hasClass 'lightbox' then return
      if target.hasClass 'ember-view' then return
      if href.indexOf "mailto" == 0 then return
      if href.match(/^http[s]?:\/\//i) && !href.match(new RegExp("^http:\\/\\/" + window.location.hostname, "i")) then return

      e.preventDefault()
      console.log('route')
      #Bsh.URL.routeTo(href)
      return false

  logout: ->
    Bsh.User.logout().then ->
      #      Bsh.KVstore.truncate()
      window.location.reload()

  currentUser: ->
    Bsh.User.current()

  start: ->
    Bsh.loadDomEvents()


Bsh.Router = Ember.Router.extend()

Bsh.Router.reopen
  location: 'history'




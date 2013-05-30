BSH = Ember.Application.createWithMixins
  rootElement: '#root'
  hasFocus: true
  scrolling: false

  signedIn: (-> @get('authState') == 'signed-in' ).property('authState')
  
  currentDate: ->
    new Date()

  defaultLocale: 'en'

BSH.Router = Ember.Router.extend()

BSH.Router.reopen
  location: 'history'

$('#root').on 'click.BSH', 'a', (e) ->
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
  #BSH.URL.routeTo(href)
  return false
  


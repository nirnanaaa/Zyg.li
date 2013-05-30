BSH = Ember.Application.createWithMixins
  rootElement: '#root'
  hasFocus: true
  scrolling: false
  signedIn: (-> @get('authState') == 'signed-in' ).property('authState')
  
  currentDate: ->
    new Date()

  defaultLocale: 'en'


BSH.Router = BSH.Router.reopen
  location: 'history'

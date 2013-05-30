BSH.View = Ember.View.extend BSH.Presence, {}

BSH.View.reopenClass
  registerHelper: (hName, hClass) ->
    Ember.Handlebars.registerHelper hName, (options) ->
      hash = options.hash
      types = options.hashTypes

    BSH.Utils.normalizeHash(hash, types)
    Ember.Handlebars.helpers.view.call @, hClass, options

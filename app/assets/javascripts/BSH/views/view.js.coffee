Bsh.View = Ember.View.extend Bsh.Presence, {}

Bsh.View.reopenClass
  registerHelper: (hName, hClass) ->
    Ember.Handlebars.registerHelper hName, (options) ->
      hash = options.hash
      types = options.hashTypes

    Bsh.Utils.normalizeHash(hash, types)
    Ember.Handlebars.helpers.view.call @, hClass, options

Zyg.View = Ember.View.extend Zyg.Presence, {}

Zyg.View.reopenClass
  registerHelper: (hName, hClass) ->
    Ember.Handlebars.registerHelper hName, (options) ->
      hash = options.hash
      types = options.hashTypes

    Zyg.Utils.normalizeHash(hash, types)
    Ember.Handlebars.helpers.view.call @, hClass, options

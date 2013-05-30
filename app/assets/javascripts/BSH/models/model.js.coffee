BSH.Model = Ember.Object.extend BSH.Presence,

  mergeAttributes: (attributes, build) ->
    self = @
    return Object.keys attributes, (key, value) ->
      if typeof value == 'object' and build and ( builder=build[key] )
        if !self.get(key)
          self.set key, Em.A()

        column = self.get k
        return value.each (object) ->
          column.pushObject build.create(object)

      else
        self.set key, value


BSH.Model.reopenClass
  extractCollectionByKey: (collection, klass) ->
    toret = {}
    if !collection then return toret

    collection.each (c) ->
      toret[c.id] = klass.create(c)

    return toret

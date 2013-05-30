BSH.Model = Ember.Object.extend BSH.Presence,

  mergeAttributes: (attributes, build) ->
    _@ = @
    return Object.keys attributes, (key, value) ->
      if typeof value == 'object' and build and ( builder=build[key] )
        if !_@get(key)
          _@set key, Em.A()

        column = _@.get k
        return value.each (object) ->
          column.pushObject build.create(object)

      else
        _@set key, value


BSH.Model.reopenClass
  extractCollectionByKey: (collection, klass) ->
    toret = {}
    if !collection then return toret

    collection.each (c) ->
      toret[c.id] = klass.create(c)

    return toret

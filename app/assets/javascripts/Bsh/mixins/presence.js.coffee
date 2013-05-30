Zyg.Presence = Em.Mixin.create
  blank: (name) ->
    prop = @[name] || @get(name)
    if (!prop)
      return true

    switch typeof prop
      when "string" then return prop.trim().isBlank()
      when "object" then return Object.isEmpty(prop)

    return false

  present: (name) ->
    return !@blank(name)



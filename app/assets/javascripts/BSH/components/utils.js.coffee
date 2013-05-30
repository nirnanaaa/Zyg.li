Bsh.Utils =
  normalizeHash: (hash, types) ->
    for prop in hash
      if types[prop] == 'ID'
        hash[prop + 'Binding'] = hash[prop]
        delete hash[prop]

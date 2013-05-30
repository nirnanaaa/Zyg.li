Bsh.HoldsCurrentUser = Em.Mixin.create
  currentUser: (->
    return Bsh.User.current()
  ).property().volatile()






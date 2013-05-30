Zyg.HoldsCurrentUser = Em.Mixin.create
  currentUser: (->
    return Zyg.User.current()
  ).property().volatile()






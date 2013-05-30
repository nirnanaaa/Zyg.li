BSH.HoldsCurrentUser = Em.Mixin.create
  currentUser: (->
    return BSH.User.current()
  ).property().volatile()






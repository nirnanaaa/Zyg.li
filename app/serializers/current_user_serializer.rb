class CurrentUserSerializer < UserSerializer
  attributes :name,
             :admin?,
             :offi?,
             :moderator?

end


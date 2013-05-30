class UserSerializer < RootSerializer
  attributes :id, 
             :username,
             :email,
             :bio,
             :created_at,
             :updated_at,
             :last_posted_at,
             :website,
             :skype

#  has_one :approved_by, embed: :object, serializer: UserSerializer

  
end

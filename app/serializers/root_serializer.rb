class RootSerializer < ActiveModel::Serializer
  embed :ids, include: true
end

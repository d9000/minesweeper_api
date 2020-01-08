class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at
end

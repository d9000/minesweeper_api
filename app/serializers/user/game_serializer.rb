class User::GameSerializer < UserSerializer

  attributes :game_id, :user_id, :status, :created_at, :mines, :seconds_played
  def game_id
    object.id
  end
end

class Game::ShowSerializer < GameSerializer
  attributes :board_revealed, :board_flagged, :board_init
  def board_init
    return nil unless object.status == 'game_over'
    object.board_init
  end
end

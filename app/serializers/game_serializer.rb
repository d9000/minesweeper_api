class GameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :status, :created_at, :mines, :rows, :cols, :seconds_played

  def mines
    object.mines_count
  end
  def rows
    object.rows_count
  end
  def cols
    object.cols_count
  end
end

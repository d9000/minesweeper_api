class Game < ApplicationRecord
  belongs_to :user
  attr_accessor :mines, :rows, :cols

  validates :rows, :cols, :mines, presence: true
  validate :mines_dimension_count

  after_create :initialize_board

  EMPTY = 'E'
  FLAG = 'F'

  def mines_count
    return unless board_init
    board_init.flatten.count(true)
  end

  def cols_count
    return unless board_init
    board_init.size
  end

  def rows_count
    return unless board_init
    board_init[0].size
  end

  def place_flag(col, row)
    board_flagged[col][row] = EMPTY if board_flagged[col][row] = FLAG
    board_flagged[col][row] = FLAG if board_flagged[col][row] = EMPTY
    update_column(:board_flagged, board_flagged)
  end

  def check(col, row)
    return update_column(:status, 'game_over') if board_init[col][row]
    reveal(col, row)
  end

  def reveal(col, row)
    #if false, reveal neighbor cells
    board_revealed[col][row] = 0
  end

private
  def initialize_board
    return if board_init
    board = Array.new(cols) {Array.new(rows)}
    mines.times do
      col = rand(0..(cols - 1))
      row = rand(0..(rows - 1))
      board[col][row] = true
    end
    board.size.times do |c|
      board[c].size.times do |r|
        board[c][r] = false unless board[c][r]
      end
    end
    self.board_init = board
    self.board_revealed = Array.new(cols) {Array.new(rows)}
    board_flagged = Array.new(cols) {Array.new(rows)}
    board_flagged.size.times do |c|
      board_flagged[c].size.times do |r|
        board_flagged[c][r] = EMPTY
      end
    end
    self.board_flagged = board_flagged
    self.status = 'playing'
    self.save
  end

  def mines_dimension_count
    cells = rows * cols
    errors.add(:mines, 'Incorrent rows, cols or mines') if (rows <= 0 || cols <= 0 || mines <= 0) && mines > cells
  end
end

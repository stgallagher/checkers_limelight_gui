module Gameplay

  COLUMN_LETTERS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

  def square_clicked(square)
    if @from == nil
      @from = square.id
    else
      @to = square.id
    end
  end

  def board_square_to_coordinate_pair(board_square)
    coords = []
    board_square.each_char do |char|
      if COLUMN_LETTERS.include?(char)
        coords << COLUMN_LETTERS.index(char)
      else
      coords << char.to_i - 1
      end
    end
    coords.reverse
  end

  def coordinate_translator(from, to)
    first  = board_square_to_coordinate_pair(from)
    second = board_square_to_coordinate_pair(to)
    first + second
  end

  def get_move_coordinates(current_player)
    while @from.nil? or @to.nil?
    end
    coords = coordinate_translator(@from, @to)
    @from = nil
    @to = nil
    coords
  end

  def move_checker(from, to)
    moving_checker = scene.find(from).children[0]
    scene.find(to).add(moving_checker)
    scene.find(from).remove(moving_checker)
  end

  def render_board(board)
    0.upto(7) do |x_coord|
      0.upto(7) do |y_coord|
        if board[x_coord][y_coord].nil?
          scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").remove_all
        else
          if board[x_coord][y_coord].color == :red
            if (board[x_coord][y_coord].is_king?) == true
              scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                red_king_checker :float => :on
              end
            else
              #p "RENDER_BOARD::before red checker build : y_coord = #{y_coord} , x_coord + 1 = #{x_coord + 1} , COLUMN_LETTERS[x_coord] = #{COLUMN_LETTERS[y_coord]}"
              scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
              #p "RENDER_BOARD::in red checker"
                red_checker :float => :on
              end
            end
          elsif board[x_coord][y_coord].color == :black
            if (board[x_coord][y_coord].is_king?) == true
              scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                black_king_checker :float => :on
              end
            else
              scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                black_checker :float => :on
              end
            end
          end
        end
      end
    end
  end
end

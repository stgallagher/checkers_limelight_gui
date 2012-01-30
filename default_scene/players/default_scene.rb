module DefaultScene

#  def scene_opened
#
#  end

  def intro
    p "In Intro"
  end

  def one_or_two_player

  end

  def render_board(production.game.board)
    board = production.game.board

    ('A'..'H') do |x_coord|
      1.upto(8) do |y_coord|
        if !board[x_coord][y_coord].nil?
          if board[x_coord][y_coord].color == :red
            if (board[x_coord][y_coord].is_king?) == true
              scene.board_square.find("#{x_coord}#{y_coord}").build do
                red_checker :float => :on
              end
            else
              scene.board_square.find("#{x_coord}#{y_coord}").build do
                red_checker :float => :on
              end
            end
          elsif board[x_coord][y_coord].color == :black
            if (board[x_coord][y_coord].is_king?) == true
              scene.board_square.find("#{x_coord}#{y_coord}").build do
                black_checker :float => :on
          end
            else
              scene.board_square.find("#{x_coord}#{y_coord}")
                black_checker :float => :on
              end
            end
          end
        end
      end
    end
  end

  def get_move_coordinates(current_player)

  end

  def display_game_ending_message(production.game.board)

  end

end

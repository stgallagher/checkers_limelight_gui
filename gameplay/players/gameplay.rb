module Gameplay

  COLUMN_LETTERS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

  attr_accessor :from, :to


  def scene_opened(e)
    production.game.view = production.theater["default"].current_scene
    Thread.new{production.game.revised_game_test}
  end

  def square_clicked(square)
    if @from == nil
      @from = square.id
    else
      @to = square.id
      give_move_coordinates
    end
  end

  def save_clicked(save)
    if scene.find('display_spacer').children.size <= 1
      scene.find('display_spacer').build do
        filename_text_box_label :id => 'filename_text_box_label', :text => 'Filename:'
        filename_text_box :id => 'filename_text_box', :players => 'text_box'
      end
    end
    if scene.find('filename_text_box').text != ""
      production.game.save(scene.find('filename_text_box').text)
      scene.find('display_spacer').remove(scene.find('filename_text_box'))
      scene.find('display_spacer').remove(scene.find('filename_text_box_label'))
      scene.find('display_spacer').build do
        save_message :id => 'save_message', :text => 'Save Successful!'
      end
      sleep(3)
      scene.find('display_spacer').remove(scene.find('save_message'))
    end
  end

  def display_current_player
    current_player = production.game.current_player
    scene.find('lower_panel').show_current_player(current_player)
  end

  def display_movement(from, to, current_player)
    scene.find('game_info_panel').move_history(from, to, current_player)
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

  def board_square_translator(move)
    locations = []
    move.each_slice(2) do |coords|
      locations << COLUMN_LETTERS[coords[1]]
      locations << coords[0] + 1
    end
    coords = []
    coords << locations[0] +locations[1].to_s
    coords << locations[2] +locations[3].to_s
    coords
  end

  def move_feedback(status, move)
    scene.find('lower_panel').move_status(status)
    movement = board_square_translator(move)
    @from = movement[0]; @to = movement[1]
    @current_player = production.game.current_player == :red ? :black : :red
    display_movement(@from, @to, @current_player) if status.nil? or status == 'jumping move'
    display_current_player
    @from = nil
    @to = nil
  end

  def give_move_coordinates
    @current_player = production.game.current_player
    coords = coordinate_translator(@from, @to)
    production.game.set_move_coordinates(coords)
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
              if scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").children.size == 0
                scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                  red_king_checker :text => 'KING',  :float => :on
                end
              end
            else
              if scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").children.size == 0
                scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                  red_checker :float => :on
                end
              end
            end
          elsif board[x_coord][y_coord].color == :black
            if (board[x_coord][y_coord].is_king?) == true
              if scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").children.size == 0
                scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").build do
                  black_king_checker :text => 'KING', :float => :on
                end
              end
            else
              if scene.find("#{COLUMN_LETTERS[y_coord]}#{x_coord + 1}").children.size == 0
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

  def game_over(winner)
    winner == :red ? red_wins : black_wins
  end

  def game_is_over(loser)
    loser == :red ? black_wins : red_wins
  end

  def red_wins
    a = 1
    b = 10000
    while true
      scene.find('board_panel').build do
        winner_alert :id => "winner#{a}", :styles => 'winner_alert_red_flash_one', :text => "Congratulations, Red, You have won!!!", :float => :on
      end
      sleep(0.5)
      scene.find('board_panel').remove("winner#{a}")
      scene.find('board_panel').build do
        winner_alert :id => "winner#{b}", :styles => 'winner_alert_red_flash_two', :text => "Congratulations, Red, You have won!!!", :float => :on
      end
      sleep(0.5)
      scene.find('board_panel').remove("winner#{b}")
      a += 1
      b += 1
    end
  end

  def black_wins
    a = 1
    b = 10000
    while true
      scene.find('board_panel').build do
        winner_alert :id => "winner#{a}", :styles => 'winner_alert_black_flash_one', :text => "Congratulations, Black, You have won!!!", :float => :on
      end
      sleep(0.5)
      scene.find('board_panel').remove("winner#{a}")
      scene.find('board_panel').build do
        winner_alert :id => "winner#{b}", :styles => 'winner_alert_black_flash_two', :text => "Congratulations, Black, You have won!!!", :float => :on
      end
      sleep(0.5)
      scene.find('board_panel').remove("winner#{b}")
      a += 1
      b += 1
    end
  end

end

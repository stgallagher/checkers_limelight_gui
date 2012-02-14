class Game

  attr_accessor :view, :difficulty, :number_of_players, :game_board, :board, :gui,
                :single_player_game, :current_player , :x_orig, :y_orig, :x_dest, :y_dest

  def initialize(view)
    @view = view
    @current_player = :red
    @bs = BoardSurvey.new
    @evaluation = Evaluation.new
    @input = UserInput.new
    @move_check = MoveCheck.new
    @board = Board.new
    @game_board = @board.create_board
    @minmax = Minimax.new(@bs, @evaluation)
  end

  def play_test_game
    @game_board = @board.create_test_board
    @board.add_checker(@game_board, :red, 0, 0)
    @board.add_checker(@game_board, :red, 0, 6)
    @board.add_checker(@game_board, :black, 7, 1)
    @board.add_checker(@game_board, :black, 7, 7)
  end

  def game_test
    options = @view.begin_game
    @difficulty = options[0]
    @number_of_players = options[1]
    p "IN GAME::GAME_TEST -> difficulty = #{@difficulty} , #{@number_of_players}"
    @view.render_board(@game_board)
    while
      coordinates =@view.get_move_coordinates(@current_player)
      message = @move_check.move_validator(self, @game_board, @current_player, coordinates[0], coordinates[1], coordinates[2], coordinates[3])
      @view.move_feedback(message)
      @view.render_board(@game_board)
    end
  end

  def game_setup
    #play_test_game
    options = @view.begin_game
    @difficulty = options[0]
    @number_of_players = options[1]
  end

  def revised_game_test
    @view.render_board(@game_board)
    while(game_over?(@game_board) == false)
      message = nil
      @view.render_board(@game_board)
      if (@number_of_players == 'one' or @number_of_players == 'none') and @current_player == :red
        @move =@minmax.best_move_negamax(@game_board, :red, 3, @difficulty)
        if @move.nil?
          @view.game_is_over(:red)
        end
        message = @move_check.move_validator(self, @game_board, :red,  @move[0], @move[1], @move[2], @move[3])
      elsif @number_of_players == 'none' and @current_player == :black
        @move =@minmax.best_move(@game_board, :black, 4, @difficulty)
          if @move.nil?
            @view.game_is_over(:black)
          end
        message = @move_check.move_validator(self, @game_board, :black,  @move[0], @move[1], @move[2], @move[3])
      else
        @move = nil
        while @move.nil?
          sleep(0.1)
        end
        message = @move_check.move_validator(self, @game_board, @current_player, @move[0], @move[1], @move[2], @move[3])
      end
      @view.move_feedback(message, @move)
    end
    @view.render_board(@game_board)
    winner = determine_winner(@game_board)
    @view.game_over(winner)
  end

  def set_move_coordinates(move)
    @move = move
  end

  def determine_winner(board)
    winner = @board.checkers_left(board, :black) == 0 ? :red : :black
  end

  def play_game
    @view.intro
    player_input = @view.one_or_two_player
    @single_player_game = true  if player_input == "1\n"
    while(game_over?(@game_board) == false)
      message = nil
      @view.render_board(@game_board)
      if single_player_game and @current_player == :red
        move = @minmax.best_move(@game_board, :red, 3)
        coordinates = move
        message = @move_check.move_validator(self, @game_board, :red,  coordinates[0], coordinates[1], coordinates[2], coordinates[3])
      else
        coordinates = @view.get_move_coordinates(@current_player)

        message = @move_check.move_validator(self, @game_board, @current_player, coordinates[0], coordinates[1], coordinates[2], coordinates[3])
      end
      puts message unless (message.nil? or message == "jumping move")
    end
    @view.render_board(@game_board)
    @view.display_game_ending_message(@game_board)
  end

  def move(board, x_origin, y_origin, x_destination, y_destination)
    #moving
    moving_checker = board[x_origin][y_origin]

    # set new location for checker
    moving_checker.x_pos = x_destination
    moving_checker.y_pos = y_destination

    # update board positions of checker
    board[x_origin][y_origin] = nil
    board[x_destination][y_destination] = moving_checker
  end

  def game_over?(board)
    @board.checkers_left(board, :black) == 0 or @board.checkers_left(board, :red) == 0
  end

  def self.switch_player(current_player)
    current_player == :red ? :black : :red
  end


  def save_game(name, game_board, current_player, difficulty, number_of_players)
    game_info = { :board => game_board,
                  :current_player => current_player,
                  :difficulty => difficulty,
                  :number_of_players => number_of_players}

    saved_game = Marshal.dump(game_info)
    file = File.new(File.expand_path("saved_games/" + name), 'w')
    file.write saved_game
    file.close
  end

  def save(filename)
    save_game(filename, @game_board, @current_player, @difficulty, @number_of_players)
  end

  def load(filename)
    file = File.open(File.expand_path("saved_games/" + filename), 'r')
    loaded_game = Marshal.load file.read
    file.close

    @current_player = loaded_game[:current_player]
    @game_board = loaded_game[:board]
    @difficulty = loaded_game[:difficulty]
    @number_of_players = loaded_game[:number_of_players]
  end

end

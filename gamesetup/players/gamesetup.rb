module Gamesetup

  def begin_game
    p "in begin game"
    scene.load('gameplay')
    #@ai = scene.ai_type
    #@one_or_two_player = scene.one_or_two_player
  end

  def ai_type
    #return scene.find("computer_ai_selector").value
  end

  def one_or_two_player
    #return scene.find("number_of_players_selector").value
  end

end

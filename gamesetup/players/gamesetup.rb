module Gamesetup

  def start_clicked(click)
    @start_the_game = true
  end

  def load_clicked(click)
    scene.load('loadgame')
  end

  def begin_game
    while @start_the_game.nil?
      sleep(1)
    end
    options = []
    options << scene.ai_type
    options << scene.number_of_players
    scene.load('gameplay')
    production.game.view = production.theater["default"].current_scene
    options
  end

  def ai_type
    ai = scene.find("computer_ai_selector").value
    if ai == "Easy (Random)"
      return 3
    elsif ai == "Board Scoring"
      return 1
    elsif ai == "Checker Counting"
      return 2
    end
  end

  def number_of_players
    return scene.find("number_of_players_selector").value
  end

end

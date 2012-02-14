module GameInfoPanel

  def move_history(from, to, current_player)
    scene.find('game_info_panel').build do
      if current_player == :red
        movement :text => "#{from} -> #{to}", :styles => 'red_move_history'
      else
        movement :text => "#{from} -> #{to}", :styles => 'black_move_history'
      end
    end
    if scene.find('game_info_panel').children.size > 20
      scene.find('game_info_panel').remove(scene.find('game_info_panel').children[1])
    end
  end

end

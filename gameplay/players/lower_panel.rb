module LowerPanel

  def move_status(status)
    if status == 'jumping move'
      status = status.capitalize
    end
    scene.find('move_status').text = status
    scene.find('move_status').text = 'Successful Move' if status.nil?
  end

  def show_current_player(current_player)
   scene.find('display_current_player').text = current_player.to_s.capitalize
  end

end

module GameInfoPanel
  puts "outside mouse clicked"
  def mouse_clicked(event)
    scene.find('game_info_panel').build do
      checker :float => :on
    end
  end
end

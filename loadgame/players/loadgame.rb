module Loadgame

  def scene_opened(e)
    require 'Pathname'
    saved_games_path = Pathname.new(File.expand_path("../../../../saved_games/", __FILE__))
    saved_games_path.directory?
    saved_games_path.children.each do |file|
      scene.build do
        saved_games_list_item :id => "#{file.basename.to_s}", :text => "#{file.basename.to_s}"
      end
    end
  end

  def load_clicked(file)
    p "Load clicked with file #{file.id}"
    production.game.load(file.id)
    scene.load('gameplay')
    production.game.view = production.theater["default"].current_scene
  end

end

module BoardSquare

  def mouse_clicked(event)
    scene.find('A1').build do
      checker :float => :on
    end
  end
end

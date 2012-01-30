# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
  background_color '#CCFFCC'
  horizontal_alignment :left
  vertical_alignment :top
  width "100%"
  height "100%"
}

corner_offset {
  background_color '#9CF'
  width  20
  height 20
}

board_panel {
  background_color '#66C'
  horizontal_alignment :left
  vertical_alignment :top
  width 840
  height 840
}

game_info_panel {
  background_color '#339966'
  width 360
  height 840
  border_color '#000'
  border_width 1
  horizontal_alignment :left
  vertical_alignment :top
}

lower_panel {
  background_color '#0CC'
  width 1200
  height 160
  border_color '#000'
  border_width 1
}

row_column_label {
  background_color '#66C'
  border_color '#000'
  border_width 1
  font_size 10
}

column_label {
  extends :row_column_label
  width 100
  height 20
}

row_label {
  extends :row_column_label
  width 20
  height 100
}

square {
  width 100
  height 100
  border_color '#000'
  border_width 1
}

traversable_square {
  extends :square
  background_color '#CFF'
}

non_traversable_square {
  extends :square
  background_color '#609'
}

checker {
  width 98
  height 98
  rounded_corner_radius 49
  border_color '#000'
  border_width 1
  horizontal_alignment :center
  vertical_alignment :center
}

red_checker {
  background_color '#F00'

  hover {
    border_color '#FFF'
    background_color '#F66'
  }
}

black_checker {
  background_color '#000'

  hover {
    border_color '#FFF'
    background_color '#666'
  }
}

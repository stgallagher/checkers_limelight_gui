# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

game_play {
  background_color '#CCFFCC'
  #horizontal_alignment :left
  #vertical_alignment :top
  width 800
  height 800
}

corner_offset {
  background_color '#9CF'
  width  20
  height 20
}

board_panel {
  background_color '#66C'
  #horizontal_alignment :left
  #vertical_alignment :top
  width 680
  height 680
}

game_info_panel {
  background_color '#339966'
  width 120
  height 680
  border_color '#000'
  border_width 1
  #horizontal_alignment :left
  #vertical_alignment :top
}

lower_panel {
  background_color '#0CC'
  width 800
  height 120
  border_color '#000'
  border_width 1
}

move_status_label {
  vertical_alignment :center
  horizontal_alignment :center
}

move_status {
  width 200
  background_color '#66C'
  border_color '#000'
  border_width 1
  font_size 10
}

row_column_label {
  background_color '#66C'
  border_color '#000'
  border_width 1
  font_size 10
}

column_label {
  extends :row_column_label
  width 80
  height 20
}

row_label {
  extends :row_column_label
  width 20
  height 80
}

board_square {
  width 80
  height 80
  border_color '#000'
  border_width 1
  horizontal_alignment :center
  vertical_alignment :center
  hover {
    border_color 'FF0'
    border_width 5
  }
}

traversable_square {
  extends :board_square
  background_color '#CFF'
  horizontal_alignment :center
  vertical_alignment :center
}

non_traversable_square {
  extends :board_square
  background_color '#609'
}

checker {
  width 60
  height 60
  rounded_corner_radius 30
  border_color '#000'
  border_width 1

}

red_checker {
  extends :checker
  background_color '#F00'

  hover {
    border_color '#FFF'
    background_color '#F66'
  }
}

black_checker {
  extends :checker
  background_color '#000'

  hover {
    border_color '#FFF'
    background_color '#666'
  }
}

red_king_checker {
  extends :checker
  background_color '#F00'

  hover {
    border_color '#FFF'
    background_color '#F66'
  }
}

black_king_checker {
  extends :checker
  background_color '#000'

  hover {
    border_color '#FFF'
    background_color '#666'
  }
}

# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

gameplay {
  background_color :white
  width  '100%'
  height '100%'
}

corner_offset {
  background_color :dark_red
  width  20
  height 20
}

board_panel {
  background_color :white
  horizontal_alignment :center
  vertical_alignment :center
  width 680
  height 680
}

lower_panel {
  height 120
  width 800
  background_color :gray
  border_color :black
  border_width 1
}

move_status_label {
  height 40
  width 130
  background_color :white
  border_color :black
  right_border_color :white
  border_width 1
  font_size 20
  font_face :arial
}

move_status {
  height 40
  width 540
  left_padding 20
  background_color :white
  border_color :black
  left_border_color :white
  border_width 1
  font_size 20
  font_face :arial
}

display_current_player_label {
  height 40
  width 120
  font_face :arial
  font_size 20
}

display_spacer {
  height 60
  width 668
  background_color :gray
}

save_button {
  height 40
  width 120
  top_margin 10
  left_margin 10
  background_color :red
  font_face :arial
  font_size 20
}

filename_text_box_label {
  height 40
  width 100
  top_margin 10
  top_padding 7
  left_margin 10
  background_color :grey
  font_face :arial
  font_size 18
  horizontal_alignment :center
  vertical_alignment :top
}

filename_text_box {
  height 40
  width 300
  top_margin 10
  left_margin 10
  background_color :red
  font_face :arial
  font_size 20
}

save_message {
  height 40
  width 200
  top_margin 10
  left_margin 10
  background_color :grey
  font_face :arial
  font_size 24
  horizontal_alignment :center
  vertical_alignment :center
}

display_current_player{
  height 60
  width 120
  font_face :arial
  font_size 30
  left_border_color :black
  left_border_width 1
  horizontal_alignment :center
  vertical_alignment :top
}

display_current_player_red {
  extends :display_current_player
  text_color :red
}

display_current_player_black {
  extends :display_current_player
  text_color :black
}

row_column_label {
  background_color :black
  border_color :red
  border_width 1
  font_size 10
  text_color :white
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
  border_width 1
  horizontal_alignment :center
  vertical_alignment :center
  hover {
    border_color :red
    border_width 5
  }
}

traversable_square {
  extends :board_square
  background_color :white
  border_color :white
}

non_traversable_square {
  extends :board_square
  background_color :grey
  border_color :grey
}

checker {
  width 75
  height 75
  rounded_corner_radius 37.5
  border_color '#000'
  border_width 1
  horizontal_alignment :center
  vertical_alignment :center
  text_color :white
  font_face :arial
  font_size 12
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

game_info_panel {
  background_color :white
  width 120
  height 680
  border_color :black
  border_width 1
  horizontal_alignment :center
  vertical_alignment :top
}

move_history_label {
  height 20
  width 120
  bottom_border_width 1
  bottom_border_color :black
  font_face :arial
  font_size 16
  horizontal_alignment :center
  vertical_alignment :top
}

move_history {
  height 25
  width 120
  font_face :arial
  font_size 20
}

red_move_history {
  extends :move_history
  text_color :red
}

black_move_history {
  extends :move_history
  text_color :black
}

winner_alert {
  top_margin 200
  bottom_margin 150
  left_margin 180
  right_margin 90
  border_width 1
  border_color :black
  font_face :arial
  font_size 25
  width 600
  height 600
  rounded_corner_radius 100
  horizontal_alignment :center
  vertical_alignment :center
}

winner_alert_red_flash_one {
  extends :winner_alert
  background_color :red
  text_color :white
}

winner_alert_red_flash_two {
  extends :winner_alert
  background_color :white
  text_color :red
}

winner_alert_black_flash_one {
  extends :winner_alert
  background_color :black
  text_color :white
}

winner_alert_black_flash_two {
  extends :winner_alert
  background_color :white
  text_color :black
}

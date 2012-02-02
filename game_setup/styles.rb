game_setup {
  background_color :black
  background_image "images/checkers_background_bear.png"
  background_image_fill_strategy :static
  width '100%'
  height '100%'
}

start_button {
  background_color :red
  border_color :black
  border_width 1
  text_color :black
  font_face :arial
  font_size 22
  padding 20
  margin 270
  width 800
  height 600
  rounded_corner_radius 20
  horizontal_alignment :center
  vertical_alignment :center
}

selector {
  top_margin 70
  width 200
  height 200
  horizontal_alignment :center
  vertical_alignment :center
}

label {
  top_margin 70
  text_color :white
  font_face :arial
  font_size 15
  width 200
  height 200
  horizontal_alignment :center
  vertical_alignment :center
}


number_of_players_label {
  extends :label
}
number_of_players_selector {
  extends :selector
}

computer_ai_label {
  extends :label
}

computer_ai_selector {
  extends :selector
}



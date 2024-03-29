# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

LETTERS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']


  board_panel :id => 'board_panel'  do
    upper_left_corner :styles => "corner_offset"

    ('A'..'H').each do |text|
      label_row :text => text, :styles => "column_label"
    end

    upper_right_corner :styles => "corner_offset"

    (1..8).each do |row|
      label_row :text => row, :styles => "row_label"
      (1..8).each do |square|
        if square % 2 == 1
          if [ 2, 4, 6, 8].include?(row)
            board_square :styles => "non_traversable_square", :id => "#{LETTERS[square - 1]}#{row}"
          else
            board_square :styles => "traversable_square", :id => "#{LETTERS[square - 1]}#{row}"
          end
        else
          if [1, 3, 5, 7].include?(row)
            board_square :styles => "non_traversable_square", :id => "#{LETTERS[square - 1]}#{row}"
          else
            board_square :styles => "traversable_square", :id => "#{LETTERS[square - 1]}#{row}"
          end
        end
      end
      label_row :text => row, :styles => "row_label"
    end

    lower_left_corner :styles => "corner_offset"

    ('A'..'H').each do |text|
      label_row :text => text, :styles => "column_label"
    end

    lower_right_corner :styles => "corner_offset"
  end

  game_info_panel :styles => "game_info_panel", :id => 'game_info_panel' do
    move_history_label :text => 'Move History'
  end

  lower_panel :id => 'lower_panel' do
    move_status_label :text => "Move Status:", :id => 'move_status_label'
    move_status :id => 'move_status', :text => 'Ready to begin game'
    display_current_player_label :text => 'Player'
    display_spacer :id => 'display_spacer' do
      save_button :id => 'save_button', :players => 'button', :text => 'Save Game'
    end
    display_current_player :id => 'display_current_player', :text => "Red", :styles => 'display_current_player_black'
  end

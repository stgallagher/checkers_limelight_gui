start_button :id => 'start_button', :text => 'Start Game'

load_button :id => 'load_button', :text => 'Load Game'

number_of_players_label :id => 'number_of_players_label', :text => 'Select number of players'

number_of_players_selector :id => 'number_of_players_selector', :players => 'combo_box', :choices => ['none','one','two'], :value => 'none'

computer_ai_label :id => 'computer_ai_label', :text => 'Select type of AI'

computer_ai_selector :id => 'computer_ai_selector', :players => 'combo_box', :choices => ['Easy (Random)', 'Board Scoring', 'Checker Counting'], :value => 'Easy (Random)'


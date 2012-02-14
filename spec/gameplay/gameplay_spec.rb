
require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'

describe "Game Play" do

  uses_limelight :scene => "gameplay", :hidden => true


  before(:each) do
    @game = Game.new(scene)
    board = @game.game_board
    scene.render_board(board)
  end

  it "has board squares" do
    #p scene.children
    props = scene.children[0].find_by_name('board_square')
    props.size.should > 0
  end

  it "has 64 board squares" do
    #p scene.children
    props = scene.children[0].find_by_name('board_square')
    props.size.should == 64
  end

  it "has red checkers" do
    #p scene.find("A1")
    props = scene.children[0].find_by_name('red_checker')
    props.size.should > 0
  end

  it "has black checkers" do
    props = scene.children[0].find_by_name('black_checker')
    props.size.should > 0
  end

  it "moves a checker" do
    scene.move_checker('A3', 'B4')
    prop_from = scene.find('A3').children[0]
    prop_to = scene.find('B4').children[0]
    prop_from.should == nil
    prop_to.name.should == 'red_checker'
  end

  it "displays current player" do
    pending
    @game.current_player = :black
    p "IN DISPLAY TEST #{production.game.current_player}"
    scene.find('lower_panel').children[3].text.should == 'black'
  end


  it "gives from and to squares based upon where the mouse is clicked and unclicked" do
    square1 = double("square1")
    square2 = double("square2")
    square1.stub(:id).and_return('A3')
    square2.stub(:id).and_return('B4')
    scene.square_clicked(square1)
    scene.from.should == 'A3'
    scene.square_clicked(square2)
    scene.to.should == 'B4'
  end

  it "displays a movement history" do
    from = 'A3'
    to = 'B4'
    current_player = 'Black'
    scene.display_movement(from, to, current_player)
    scene.find('game_info_panel').children[1].text.should == 'A3 -> B4'
  end

  it "converts a board square ID to a coordinate pair" do
    scene.board_square_to_coordinate_pair('F5').should == [4, 5]
  end

  it "translates a pair of board square IDs to move coordinates" do
    scene.coordinate_translator('A3', 'B4').should == [2, 0, 3, 1]
    scene.coordinate_translator('F2', 'G3').should == [1, 5, 2, 6]
    scene.coordinate_translator('C7', 'A5').should == [6, 2, 4, 0]
    scene.coordinate_translator('E1', 'C3').should == [0, 4, 2, 2]
  end

  it "translates move coordinates to board square IDs" do
    scene.board_square_translator([2, 0, 3, 1]).should == ['A3', 'B4']
    scene.board_square_translator([1, 5, 2, 6]).should == ['F2', 'G3']
    scene.board_square_translator([6, 2, 4, 0]).should == ['C7', 'A5']
    scene.board_square_translator([0, 4, 2, 2]).should == ['E1', 'C3']
  end

  it "displays movement_status" do
    pending
    scene.from = 'A3'
    scene.to = 'B4'
    @current_player = 'Black'
    status = "This is a test status"
    scene.move_feedback(status)
    scene.find('move_status').text.should == "This is a test status"
  end

end

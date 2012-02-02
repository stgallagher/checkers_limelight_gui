
require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'

describe "Game Play" do

  uses_limelight :scene => "game_play", :hidden => true


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

  it "gives from and to squares based upon where the mouse is clicked and unclicked" do
    pending
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
end

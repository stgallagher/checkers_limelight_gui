require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'

describe "Game Setup" do

  uses_limelight :scene => "gamesetup", :hidden => true

  it "enables a choice of a one or two player game" do
    number_of_players = scene.find_by_name('number_of_players_selector')
    number_of_players[0].choices[0].should == "none"
    number_of_players[0].choices[1].should == "one"
    number_of_players[0].choices[2].should == "two"
  end

  it "enables the choice of different types of AI" do
    computer_ai = scene.find_by_name('computer_ai_selector')
    computer_ai[0].choices[0].should == "Easy (Random)"
    computer_ai[0].choices[1].should == "Board Scoring"
    computer_ai[0].choices[2].should == "Checker Counting"
  end
end

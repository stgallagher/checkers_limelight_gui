require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Saved Games List Item" do

  uses_limelight :scene => "saved_games_list_item", :hidden => true

  #it "reports its id upon mouse click" do
  #  pending
  #  root.mouse_clicked(nil).should == ''
  #end
end


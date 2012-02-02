require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Board Square" do

  uses_limelight :scene => "board_square", :hidden => true

  it "reports its id upon mouse click" do
    pending
    root = scene.children[0]
    root.mouse_clicked(nil).should == ''
  end
end


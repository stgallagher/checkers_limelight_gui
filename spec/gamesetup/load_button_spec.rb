require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Load Button" do

  uses_limelight :scene => "load_button", :hidden => true

  #it "reports its id upon mouse click" do
  #  pending
  #  root.mouse_clicked(nil).should == ''
  #end
end


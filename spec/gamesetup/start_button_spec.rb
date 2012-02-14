require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Start Button" do

  uses_limelight :scene => "start_button", :hidden => true

  #it "reports its id upon mouse click" do
  #  pending
  #  root.mouse_clicked(nil).should == ''
  #end
end


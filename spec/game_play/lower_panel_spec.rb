require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Lower Panel" do

  uses_limelight :scene => "lower_panel", :hidden => true

  it "displays move status info" do
    pending
    root = scene.children[1]
    root.should == 'This is a test string'
  end
end

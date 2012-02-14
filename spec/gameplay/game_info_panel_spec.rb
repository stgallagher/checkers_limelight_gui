require File.expand_path(File.dirname(__FILE__) + "/../../gems/bundler/setup")
require 'spec_helper'
require 'draughts'

describe "Game Info Panel" do

  uses_limelight :scene => "game_info_panel", :hidden => true

  it "reports its id upon mouse click" do
    pending
  end
end


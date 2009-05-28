$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'rubygems'
require 'acts_as_fu'
require 'spec'

Spec::Runner.configure do |config|
  config.include ActsAsFu
end

require File.dirname(__FILE__) + "/../rails/init"


describe "freeze_attributes" do
  before(:each) do
    build_model :things do
      string :string_attribute, :default => "foobar"
      
      # Turn off acts_as_foo's method_missing extension for schema
      # definition.  For some reason, it delegates #define_method to
      # the table definition.
      class << self
        alias_method :method_missing, :method_missing_without_columns
      end
      
      freeze_attributes :string_attribute
    end
  end
  
  describe "freezes attributes which are" do
    before { @thing = Thing.new }
    specify("strings") { @thing.string_attribute.should be_frozen }
  end
end

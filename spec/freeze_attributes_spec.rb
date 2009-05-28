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
      string :serialized_attribute
      serialize :serialized_attribute
      
      # Turn off acts_as_foo's method_missing extension for schema
      # definition.  For some reason, it delegates #define_method to
      # the table definition.
      class << self
        alias_method :method_missing, :method_missing_without_columns
      end
      
      freeze_attributes :string_attribute, :serialized_attribute
    end
  end
  
  describe "freezes attributes which are" do
    before do
      @thing = Thing.new(:string_attribute => "foobar",
                         :serialized_attribute => [:a, :b, :c])
    end
    
    specify("strings") { @thing.string_attribute.should be_frozen }
    specify("serialized") { @thing.serialized_attribute.should be_frozen }
  end
end

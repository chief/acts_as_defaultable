require 'spec_helper'

describe StringDefault do

  let(:one) { FactoryGirl.build(:string_default) }
  let(:two) { FactoryGirl.build(:true_string_default) }

  it 'should have a class method named default' do
    StringDefault.respond_to?('default').should be true
  end

  it 'should have a default column definition' do
    StringDefault.respond_to?('default_column').should be true
  end

  it 'should return the argument as the default column' do
    StringDefault.default_column.should be_eql('default')
  end

  it 'should have a default positive value' do
    StringDefault.default_positive_value.should be_eql("on")
  end

  it 'should have a default negative value' do
    StringDefault.default_negative_value.should be_eql('off')
  end

  it 'should return nil if there is no default object' do
    one.default = 'off'
    one.save
    StringDefault.default.should be_nil
  end

  it 'should return a default object' do
    one.default = 'on'
    one.save
    StringDefault.default.should be_eql(one)
  end

  it 'should set unique default object' do
    two.default = 'on'
    two.save
    one.default = 'on'
    two.save
    StringDefault.default.should be_eql(two)
  end

  it 'should return all defaults' do
    one.default = 'on'
    one.save
    two.default = 'on'
    two.save
    StringDefault.all_defaults.size.should be_eql(1)
  end

end

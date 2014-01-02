require 'spec_helper'

describe TestDefault do

  let(:one) { FactoryGirl.build(:td_one) }
  let(:two) { FactoryGirl.build(:td_two) }

  it 'should have a class method named default' do
    TestDefault.respond_to?('default').should be_true
  end

  it 'should have a default column definition' do
    TestDefault.respond_to?('default_column').should be_true
  end

  it 'should return the argument as the default column' do
    TestDefault.default_column.should be_eql('default')
  end

  it 'should have a default positive value' do
    TestDefault.default_positive_value.should be_eql(true)
  end

  it 'should have a default negative value' do
    TestDefault.default_negative_value.should be_eql(false)
  end

  it 'should return nil if there is no default object' do
    one.default = false
    one.save
    TestDefault.default.should be_nil
  end

  it 'should return a default object' do
    one.default = true
    one.save
    TestDefault.default.should be_eql(one)
  end

  it 'should set unique default object' do
    two.default = true
    two.save
    one.default = true
    two.save
    TestDefault.default.should be_eql(two)
  end

  it 'should return all defaults' do
    one.default = true
    one.save
    two.default = true
    two.save
    TestDefault.all_defaults.size.should be_eql(1)
  end

end

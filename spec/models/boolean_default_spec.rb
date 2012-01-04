require 'spec_helper'

describe BooleanDefault do

  let(:one) { FactoryGirl.build(:boolean_default) }
  let(:two) { FactoryGirl.build(:true_boolean_default) }

  it 'should have a class method named default' do
    BooleanDefault.respond_to?('default').should be_true
  end

  it 'should have a default column definition' do
    BooleanDefault.respond_to?('default_column').should be_true
  end

  it 'should return the argument as the default column' do
    BooleanDefault.default_column.should be_eql('default')
  end

  it 'should have a default positive value' do
    BooleanDefault.default_positive_value.should be_eql(true)
  end

  it 'should have a default negative value' do
    BooleanDefault.default_negative_value.should be_eql(false)
  end

  it 'should return nil if there is no default object' do
    one.default = false
    one.save
    BooleanDefault.default.should be_nil
  end

  it 'should return a default object' do
    one.default = true
    one.save
    BooleanDefault.default.should be_eql(one)
  end

  it 'should set unique default object' do
    two.default = true
    two.save
    one.default = true
    two.save
    BooleanDefault.default.should be_eql(two)
  end

  it 'should return all defaults' do
    one.default = true
    one.save
    two.default = true
    two.save
    BooleanDefault.all_defaults.size.should be_eql(1)
  end


end

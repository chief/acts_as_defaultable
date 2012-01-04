require 'spec_helper'

describe Another do

  let(:another) { FactoryGirl.build(:another) }
  let(:other) { FactoryGirl.build(:other) }

  it 'should have a class method named default' do
    Another.respond_to?('default').should be_true
  end

  it 'should have a default column definition' do
    Another.respond_to?('default_column').should be_true
  end

  it 'should return the argument as the default column' do
    Another.default_column.should be_eql('unique')
  end

  it 'should have a default positive value' do
    Another.default_positive_value.should be_eql(1)
  end

  it 'should have a default negative value' do
    Another.default_negative_value.should be_eql(0)
  end

  it 'should return nil if there is no default object' do
    another.unique = 0
    another.save
    Another.default.should be_nil
  end

  it 'should return a default object' do
    another.unique = 1
    another.save
    Another.default.should be_eql(another)
  end

  it 'should set unique default object' do
    other.unique = 1
    other.save
    another.unique = 1
    another.save
    Another.default.should be_eql(another)
    #other.unique.should be_eql(0)
  end

  it 'should return all defaults' do
    another.unique = 1
    another.save
    other.unique = 1
    other.save
    Another.all_defaults.size.should be_eql(1)
  end


end

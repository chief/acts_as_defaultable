require 'spec_helper'

describe User do

  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user2) }
  let(:post1) { FactoryGirl.create(:blogPost) }
  let(:post2) { FactoryGirl.build(:blogPost2) }
  let(:other) { FactoryGirl.create(:other) }

  it 'should have a default relation column definition' do
    User.respond_to?('default_relation_column').should be true
  end

  it 'should return the argument as the default relation column' do
    User.default_relation_column.should be_eql('default_blog_post')
  end

  it 'should have an attribute named default_blog_post' do
    user1.has_attribute?('default_blog_post').should be true
  end

  it 'should return nil if there is no default relation object' do
    user1.default_blog_post.should be_nil
  end

  it 'should return the default relation object' do
    user1.default_blog_post = post1
    user1.save
    user1.default_blog_post.should be_eql(post1)
  end

  it 'should return nil if relation object is deleted' do
    user1.default_blog_post = post1
    user1.save
    post1.destroy
    user1.reload
    user1.default_blog_post.should be_nil
  end

  it "should return nil if relation object is deleted and another one take it's place" do
    user1.default_blog_post = post1
    user1.save
    id = post1.id
    post1.destroy

    post2.id = id
    post2.save
    user1.reload
    user1.reload.default_blog_post.should be_nil
  end

  it 'both users should return nil if relation object is deleted' do
    user1.default_blog_post = post1
    user2.default_blog_post = post1

    id = post1.id
    post1.destroy
    post2.id = id
    post2.save
    user1.reload
    user2.reload
    user1.default_blog_post.should be_nil
    user2.default_blog_post.should be_nil
  end

  it 'should return nil if relation object is not saved' do
    user1.default_blog_post = post2
    user1.default_blog_post.should be_nil
  end

  it 'should return nil if wrong relation object class is saved' do
    user1.default_blog_post = other
    user1.default_blog_post.should be_nil
  end

end


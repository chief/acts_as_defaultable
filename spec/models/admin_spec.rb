require 'spec_helper'

describe Admin do

  let(:admin1) { FactoryGirl.create(:admin) }
  let(:admin2) { FactoryGirl.create(:admin2) }
  let(:post1) { FactoryGirl.create(:blogPost) }
  let(:post2) { FactoryGirl.build(:blogPost2) }
  let(:other) { FactoryGirl.create(:other) }

  it 'should have a default relation column definition' do
    Admin.respond_to?('default_relation_column').should be true
  end

  it 'should return the argument as the default relation column' do
    Admin.default_relation_column.should be_eql('main_blog_post')
  end

  it 'should have an attribute named main_blog_post' do
    admin1.has_attribute?('main_blog_post').should be true
  end

  it 'should return nil if there is no default relation object' do
    admin1.main_blog_post.should be_nil
  end

  it 'should return the default relation object' do
    admin1.main_blog_post = post1
    admin1.save
    admin1.main_blog_post.should be_eql(post1)
  end

  it 'should return nil if relation object is deleted' do
    admin1.main_blog_post = post1
    admin1.save
    post1.destroy
    admin1.reload
    admin1.main_blog_post.should be_nil
  end

  it "should return nil if relation object is deleted and another one take it's place" do
    admin1.main_blog_post = post1
    admin1.save
    id = post1.id
    post1.destroy

    post2.id = id
    post2.save
    admin1.reload
    admin1.reload.main_blog_post.should be_nil
  end

  it 'both users should return nil if relation object is deleted' do
    admin1.main_blog_post = post1
    admin2.main_blog_post = post1

    id = post1.id
    post1.destroy
    post2.id = id
    post2.save
    admin1.reload
    admin2.reload

    admin1.main_blog_post.should be_nil
    admin2.main_blog_post.should be_nil
  end

  it 'should return nil if relation object is not saved' do
    admin1.main_blog_post = post2
    admin1.main_blog_post.should be_nil
  end

  it 'should return nil if wrong relation object class is saved' do
    admin1.main_blog_post = other
    admin1.main_blog_post.should be_nil
  end

end


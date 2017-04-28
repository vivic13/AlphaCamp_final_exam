require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create!( :email => "test1@example.org", :password => "12345678")
  end

  describe "#messages_count" do
    before do
      @user = User.create!( :email => "test2@example.org", :password => "12345678")
      @user2 = User.create!( :email => "test3@example.org", :password => "12345678")
      m1 = Message.create!( :user => @user2 )
      Comment.create!( :user => @user2, :message => m1 )

      m2 = Message.create!( :user => @user )
      Comment.create!( :user => @user, :message => m2)
      Comment.create!( :user => @user, :message => m2)
    end

    it "回傳該使用者的總Comment 數量" do
      expect( @user.comments.count ).to eq(2)
    end
  end

  describe "#words_count" do
    before do
      # TODO: 加 Message 和 Comment 測試資料
      @user = User.create!( :email => "test4@example.org", :password => "12345678")
      @user2 = User.create!( :email => "test5@example.org", :password => "12345678")
      m1 = Message.create!( :user => @user2, :content => "test test" )
      Comment.create!( :user => @user2, :message => m1, :content => "test test" )

      m2 = Message.create!( :user => @user, :content => "test test" )
      Comment.create!( :user => @user, :message => m2, :content => "test test" )
      Comment.create!( :user => @user, :message => m2, :content => "test test" )
    end

    it "加總該使用者的所有 Mesasge 和 Comment 的總字數" do
      # TODO: 測試 words_count 方法
      expect( @user.words_count ).to eq(6)
    end
  end

end

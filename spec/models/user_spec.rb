require 'rails_helper'

RSpec.describe User, type: :model do


  describe "#post_count" do
    before do
      @user = User.create!( :email => "test9@example.org", :password => "12345678")
      @m = @user.messages.create!( :content => "test test" )
      Comment.create!( :user => @user, :message => @m , :content => "test test" )
    end

    it "回傳該使用者的Mesasge 數量加 Comment 數量" do
      expect( @user.posts_count ).to eq(2)
    end
  end

  describe "#words_count" do
    before do
      # TODO: 加 Message 和 Comment 測試資料
      @user3 = User.create!( :email => "test4@example.org", :password => "12345678")
      @user2 = User.create!( :email => "test5@example.org", :password => "12345678")
      m1 = Message.create!( :user => @user2, :content => "test test" )
      Comment.create!( :user => @user2, :message => m1, :content => "test test" )

      m2 = Message.create!( :user => @user3, :content => "test test" )
      Comment.create!( :user => @user3, :message => m2, :content => "test test" )
      Comment.create!( :user => @user3, :message => m2, :content => "test test" )
    end

    it "加總該使用者的所有 Mesasge 和 Comment 的總字數" do
      # TODO: 測試 words_count 方法
      expect( @user3.words_count ).to eq(4)
    end
  end

end

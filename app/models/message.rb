class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes , dependent: :destroy
  has_many :users, :through => :likes

  has_many :subscribes , dependent: :destroy
  has_many :users, :through => :subscribes

  scope :pending, ->{ where( :status => "pending" ) }
  scope :completed, ->{ where( :status => "completed" ) }

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  def self.within_days(time)
      where( "created_at >= ?", Time.now - time.days )
  end

  def find_subscribe(user)
    Subscribe.find_by(:message => self, :user => user)
  end

  def already_subscribed(user)
    find_subscribe(user).present?
  end

  def find_like(user)
    Like.find_by(:message => self, :user => user)
  end

  def already_liked(user)
    find_like(user).present?
  end
end

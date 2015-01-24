class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :password, on: :create

  has_many :sent_messages, foreign_key: 'sender_id'
  has_many :received_messages, foreign_key: 'receiver_id'
end

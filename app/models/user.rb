class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, on: :create

  has_many :sent_messages, foreign_key: 'sender_id'
  has_many :received_messages, foreign_key: 'receiver_id'

  def update_karma(message)
    receiver = User.find(message.receiver.id)
    karma = self.karma
    message.thumbs_up ? karma += 1 : karma -= 1
    self.update(karma: karma)
  end
end

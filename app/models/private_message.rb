class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :recipient_messages
  has_many :recipients, class_name: "User", through: :recipient_messages
end

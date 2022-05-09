class RecipientMessage < ApplicationRecord
  validates_uniqueness_of :recipient_id, scope: :private_message_id
  belongs_to :recipient, class_name: "User"
  belongs_to :private_message
end

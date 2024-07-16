class Like < ApplicationRecord
  belongs_to :user
  belongs_to :active_storage_attachments, class_name: 'ActiveStorage::Attachment'
end

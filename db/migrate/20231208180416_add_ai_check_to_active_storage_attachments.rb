class AddAiCheckToActiveStorageAttachments < ActiveRecord::Migration[7.0]
  def change
    add_column :active_storage_attachments, :ai_check, :boolean
  end
end

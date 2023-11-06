class AddAiCheckToActiveStorageBlobs < ActiveRecord::Migration[7.0]
  def change
    add_column :active_storage_blobs, :ai_check, :boolean
  end
end

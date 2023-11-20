class AddReportToActiveStorageBlobs < ActiveRecord::Migration[7.0]
  def change
    add_column :active_storage_blobs, :report, :json
  end
end

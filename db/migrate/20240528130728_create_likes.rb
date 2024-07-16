class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :active_storage_attachments, null: false, foreign_key: true
      t.timestamps
    end
  end
end

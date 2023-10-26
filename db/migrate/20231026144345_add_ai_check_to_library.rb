class AddAiCheckToLibrary < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :ai_check, :boolean, default: nil
  end
end

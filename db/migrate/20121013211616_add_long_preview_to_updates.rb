class AddLongPreviewToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :long_preview, :text
  end
end

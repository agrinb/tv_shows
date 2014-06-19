class RemoveColumnFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :actor
  end
end

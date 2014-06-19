class RemoveColumnFromActors < ActiveRecord::Migration
  def change
    remove_column :actors, :character_id
  end
end

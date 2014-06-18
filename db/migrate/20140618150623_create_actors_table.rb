class CreateActorsTable < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :character_id
    end
  end
end

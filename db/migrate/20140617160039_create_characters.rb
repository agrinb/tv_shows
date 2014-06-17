class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character
      t.string :actor

      t.timestamps
    end
  end
end

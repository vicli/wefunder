class AddRound < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :tournament_id, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end

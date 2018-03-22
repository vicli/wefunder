class AddMatch < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :round_id
      t.boolean :active, default: true
      t.integer :contestant_one_id, null: false
      t.integer :contestant_two_id, null: false
      t.integer :contestant_one_score
      t.integer :contestant_two_score
      t.integer :winner_id
      t.timestamps
    end
  end
end

class AddContestant < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.integer :tournament_id, null: false
      t.boolean :active, default: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

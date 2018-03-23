class AddContestantRecord < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_contestant_stats do |t|
      t.integer :contestant_id, null: false
      t.integer :tournament_id, null: false
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :delta
      t.timestamps
    end
  end
end

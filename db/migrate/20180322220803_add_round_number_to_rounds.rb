class AddRoundNumberToRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :round_number, :integer, null: false
  end
end

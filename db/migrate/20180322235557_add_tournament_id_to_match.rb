class AddTournamentIdToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :tournament_id, :integer, null: false
  end
end

class RemoveNullFalseForMatches < ActiveRecord::Migration[5.1]
  def change
    change_column_null :matches, :contestant_two_id, true
  end
end

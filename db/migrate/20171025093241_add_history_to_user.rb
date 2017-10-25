class AddHistoryToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :history, :string, array: true, default: []
  end
end

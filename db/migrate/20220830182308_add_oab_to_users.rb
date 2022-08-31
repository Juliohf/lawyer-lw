class AddOabToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :oab, :string
  end
end

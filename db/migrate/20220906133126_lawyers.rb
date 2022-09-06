class Lawyers < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :lawyer, index: true, foreign_key: { to_table: :users }
    add_reference :chatrooms, :client, index: true, foreign_key: { to_table: :users }
  end
end

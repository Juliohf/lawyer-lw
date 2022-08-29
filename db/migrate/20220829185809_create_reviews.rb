class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :comments
      t.float :ratings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLawyerCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyer_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLawyerTags < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyer_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

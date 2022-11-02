class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :skill, null: false, foreign_key: true, index: true
      t.references :level, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

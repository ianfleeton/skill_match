class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :tutor, null: false, foreign_key: {to_table: :users}, index: true
      t.references :learner, null: false, foreign_key: {to_table: :users}, index: true
      t.references :skill, null: false, foreign_key: true, index: true
      t.references :level, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name, null: false
      t.string :location
      t.boolean :tutor, null: false

      t.timestamps
    end
  end
end

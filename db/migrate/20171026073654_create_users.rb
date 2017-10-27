class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_pw
      t.string :name
      t.integer :gender
      t.timestamps
    end
  end
end

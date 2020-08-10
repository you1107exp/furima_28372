class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :family_name
      t.string :first_name
      t.string :family_name_reading
      t.string :first_name_reading
      t.date :dob
      t.timestamps
    end
  end
end

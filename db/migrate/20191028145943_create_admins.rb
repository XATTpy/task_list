class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end

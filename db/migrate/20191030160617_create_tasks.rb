class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.string :assigne
      t.string :status
      t.text :description
      t.string :created_by

      t.timestamps
    end
  end
end

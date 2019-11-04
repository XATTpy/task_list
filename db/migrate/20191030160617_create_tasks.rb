class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.string :assignee
      t.string :status, default: 'To Do'
      t.text :description
      t.string :created_by
      t.string :type
      t.belongs_to :user

      t.timestamps
    end
  end
end

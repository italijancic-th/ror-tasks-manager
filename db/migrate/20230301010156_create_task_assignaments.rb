class CreateTaskAssignaments < ActiveRecord::Migration[7.0]
  def change
    create_table :task_assignaments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.timestamps
      # Handle added
      t.index [:task_id, :user_id]
      t.index [:user_id, :task_id]
    end
  end
end

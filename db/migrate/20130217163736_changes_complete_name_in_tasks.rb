class ChangesCompleteNameInTasks < ActiveRecord::Migration
  def up
  end

  def changes
    change_column :tasks, :status, :string
  end

  def down
  end
end

class RemoveAgeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :age, :integer
  end
end

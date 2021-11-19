class RemoveNullAndDefaultInComments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :text, true
  end
end

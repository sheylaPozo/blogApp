class RemoveTextDefaultInComments < ActiveRecord::Migration[6.1]
  def change
    change_column_default :comments, :text, nil
  end
end

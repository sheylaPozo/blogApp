class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true
      t.text :text, null: false, default: 'short comment'
      t.timestamps
    end
  end
end

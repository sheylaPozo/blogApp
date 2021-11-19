class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false, default: 'title'
      t.text :text, null: false, default: 'short text'
      t.timestamps
      t.integer :comments_counter, null: false, default: 0
      t.integer :likes_counter, null: false, default: 0
    end
  end
end

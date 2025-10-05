class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :post_type
      t.string :url
      t.integer :vote_count, default: 0
      t.string :author

      t.timestamps
    end
  end
end

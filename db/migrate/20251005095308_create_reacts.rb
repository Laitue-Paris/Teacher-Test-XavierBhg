class CreateReacts < ActiveRecord::Migration[7.1]
  def change
    create_table :reacts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.string :emoji
      t.timestamps
    end
  end
end

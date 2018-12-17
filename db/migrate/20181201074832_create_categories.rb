class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :body
      t.boolean :disabled, default: false
      t.integer :parent_id, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :art, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

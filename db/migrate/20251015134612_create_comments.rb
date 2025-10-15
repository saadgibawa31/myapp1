class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end

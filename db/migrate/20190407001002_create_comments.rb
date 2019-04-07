class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :article, null: false

      t.string :name, null: false
      t.string :comment, null: false
    end
  end
end

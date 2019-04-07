class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.has_many :comments
      
      t.string :subject, null: false
      t.string :body, null: false
    end
  end
end

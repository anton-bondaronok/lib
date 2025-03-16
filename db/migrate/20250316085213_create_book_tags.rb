class CreateBookTags < ActiveRecord::Migration[7.2]
  def change
    create_table :book_tags do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

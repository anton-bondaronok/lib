class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.text :short_bio

      t.timestamps
    end
  end
end

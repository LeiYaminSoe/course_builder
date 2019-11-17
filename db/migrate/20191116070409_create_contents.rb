class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title, limit: 255
      t.integer :order
      t.text :content
      t.belongs_to :chapter
      t.timestamps
    end
  end
end

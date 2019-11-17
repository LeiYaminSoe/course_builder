class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title, limit: 255
      t.integer :order
      t.belongs_to :course
      t.timestamps
    end
  end
end

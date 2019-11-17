class ChangeChapterOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :chapters, :order, :chap_order
  end
end

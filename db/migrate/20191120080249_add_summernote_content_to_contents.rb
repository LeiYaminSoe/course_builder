class AddSummernoteContentToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :summernote_content, :text
  end
end

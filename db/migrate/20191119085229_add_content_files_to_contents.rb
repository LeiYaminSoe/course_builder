class AddContentFilesToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :content_files, :string
  end
end

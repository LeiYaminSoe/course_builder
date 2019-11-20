class AddContentTypeToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :content_type, :integer, :limit => 1, :default => 1
  end
end

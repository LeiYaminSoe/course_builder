class ChangeContentOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :order, :cont_order
  end
end

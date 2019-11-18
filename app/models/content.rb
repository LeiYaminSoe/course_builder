class Content < ApplicationRecord  
  include RailsSortable::Model
  
  belongs_to :chapter
  
  set_sortable :cont_order
end

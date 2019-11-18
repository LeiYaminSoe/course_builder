class Chapter < ApplicationRecord
  include RailsSortable::Model
  
  belongs_to :course
  has_many :contents
  
  set_sortable :chap_order
end

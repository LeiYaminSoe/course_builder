class Chapter < ApplicationRecord
  include RailsSortable::Model
  
  belongs_to :course
  has_many :contents
  
  set_sortable :chap_order
  
  validates :title, presence: true
  validates_length_of :title, maximum: 255
end

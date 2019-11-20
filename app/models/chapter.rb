class Chapter < ApplicationRecord
  include RailsSortable::Model
  
  belongs_to :course
  has_many :contents, :dependent => :destroy
  
  set_sortable :chap_order
  
  validates :title, presence: true
  validates_length_of :title, maximum: 255
  
  validates :course_id, presence: true
  
  default_scope { order(chap_order: :asc) }
end

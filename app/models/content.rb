class Content < ApplicationRecord  
  include RailsSortable::Model
  
  mount_uploader :content_files, ContentFileUploader  
  belongs_to :chapter  
  set_sortable :cont_order
  
  validates :title, presence: true
  validates_length_of :title, maximum: 255
end

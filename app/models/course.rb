class Course < ApplicationRecord
  has_many :chapters, :dependent => :destroy
  
  validates :name, presence: true
  validates_length_of :name, maximum: 255
  validates :subtitle, presence: true
  validates_length_of :subtitle, maximum: 255
  validates :description, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :duration, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000 }
    
  default_scope { order(updated_at: :desc) }
  
end

class Content < ApplicationRecord  
  include RailsSortable::Model
  
  mount_uploader :content_files, ContentFileUploader  
  belongs_to :chapter  
  set_sortable :cont_order
  
  default_scope { order(cont_order: :asc) }
  
  validates :title, presence: true
  validates_length_of :title, maximum: 255
  
  validates :chapter_id, presence: true
  validates :summernote_content, presence: true, :if => Proc.new { |cont| cont.content_type == 1 }
  validates :content, presence: true, :if => Proc.new { |cont| cont.content_type == 2 }
  validates :content_files, presence: true, :if => Proc.new { |cont| cont.content_type != 1 && cont.content_type != 2 }
  
  validate :audio_valid?, :if => Proc.new { |cont| cont.content_type == 3 && cont.content_files.present? }
  validate :video_valid?, :if => Proc.new { |cont| cont.content_type == 4 && cont.content_files.present? }
  validate :pdf_valid?, :if => Proc.new { |cont| cont.content_type == 5 && cont.content_files.present? }
  
  def audio_valid?
    if content_files.file.content_type != "audio/mp3" && content_files.file.content_type != "audio/wav"
      errors.add(:base, "Attached file must be Audio File and Extension must be mp3 or wav")
    end
  end
  
  def video_valid?
    if content_files.file.content_type != "video/quicktime" && content_files.file.content_type != "video/mp4" && content_files.file.content_type != "video/x-flv" && content_files.file.content_type != "video/x-ms-wmv" && content_files.file.content_type != "video/avi"
      errors.add(:base, "Attached file must be Video File and Extension must be among mov, mp4, flv, wmv or avi")
    end
  end
  
  def pdf_valid?
    if content_files.file.content_type != "application/pdf"
      errors.add(:base, "Attached file must be pdf File and Extension must be pdf")
    end
  end

end

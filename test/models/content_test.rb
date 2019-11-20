require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save content without title" do
    content = Content.new
    assert_not_nil( content.title, "should not save content without title" )
  end
  
  test "should save content with title" do
    content = Content.new
    content.title = "test_content"
    assert( content.title.present?, "should save content with title" )
  end
  
  test "should not save content without chapter" do
    content = Content.new
    assert_not_nil( content.chapter, "should not save content without chapter" )
  end
  
  test "should save content with chapter" do
    content = Content.new
    content.chapter = Chapter.new
    assert( content.chapter.present?, "should save content with chapter" )
  end
  
  test "should not save content without summernote_content if content_type is 1" do
    content = Content.new
    content.content_type = 1
    assert_not_nil( content.summernote_content, "should not save content without summernote_content if content_type is 1" )
  end
  
  test "should not save content without content if content_type is 2" do
    content = Content.new
    content.content_type = 2
    assert_not_nil( content.content, "should not save content without content if content_type is 2" )
  end
  
  test "should not save content without content_files if content_type is not 1 or 2" do
    content = Content.new
    #content.content_type = 3
    #content.content_type = 4
    content.content_type = 5
    assert_not_nil( content.content_files, "should not save content without content_files if content_type is not 1 or 2" )
  end
  #validate :audio_valid?, :if => Proc.new { |cont| cont.content_type == 3 && cont.content_files.present? }
  #validate :video_valid?, :if => Proc.new { |cont| cont.content_type == 4 && cont.content_files.present? }
  #validate :pdf_valid?, :if => Proc.new { |cont| cont.content_type == 5 && cont.content_files.present? }
  
  test "should not save content if audio file is not valid when content_type is 3 and content_files is present" do
    content = Content.new
    content.content_type = 3
    test_file = file_fixture('movfile.mov')
    file = Rack::Test::UploadedFile.new(test_file, "video/quicktime")
    content.content_files = file
    assert( content.content_files.content_type == "audio/mp3" || content.content_files.content_type == "audio/wav", "should not save content if audio file is not valid when content_type is 3 and content_files is present" )
  end
  
  test "should not save content if video file is not valid when content_type is 4 and content_files is present" do
    content = Content.new
    content.content_type = 4
    test_file = file_fixture('pdf_test.pdf')
    file = Rack::Test::UploadedFile.new(test_file, "application/pdf")
    content.content_files = file
    assert( content.content_files.content_type == "video/quicktime" || content.content_files.content_type == "video/mp4" || content.content_files.content_type == "video/x-flv" || content.content_files.content_type == "video/x-ms-wmv" || content.content_files.content_type == "video/avi", "should not save content if video file is not valid when content_type is 4 and content_files is present" )
  end
  
  test "should not save content if pdf file is not valid when content_type is 5 and content_files is present" do
    content = Content.new
    content.content_type = 5
    test_file = file_fixture('movfile.mov')
    file = Rack::Test::UploadedFile.new(test_file, "video/quicktime")
    content.content_files = file
    assert( content.content_files.content_type == "application/pdf", "should not save content if pdf file is not valid when content_type is 5 and content_files is present" )
  end
  
  test "content_files upload" do
    content = Content.new
    content.chapter_id = 1
    content.title = "test_content"
    file = Rack::Test::UploadedFile.new(file_fixture('pdf_test.pdf'), "application/pdf")
    content.content_files = file
    assert(content.save, "File upload")
  end
  
end

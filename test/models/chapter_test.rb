require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save chapter without title" do
    chapter = Chapter.new
    assert_not_nil( chapter.title, "should not save chapter without title" )
  end
  
  test "should save chapter with title" do
    chapter = Chapter.new
    chapter.title = "test_chapter"
    assert( chapter.title.present?, "should save chapter with title" )
  end
  
  test "should not save chapter without course" do
    chapter = Chapter.new
    assert_not_nil( chapter.course, "should not save chapter without course" )
  end
  
  test "should save chapter with course" do
    chapter = Chapter.new
    chapter.course = Course.new
    assert( chapter.course.present?, "should save chapter with course" )
  end
  
end

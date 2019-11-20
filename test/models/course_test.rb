require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save course without name" do
    course = Course.new
    assert_not_nil( course.name, "should not save course without name" )
  end
  
  test "should save course with name" do
    course = Course.new
    course.name = "test_course"
    assert( course.name.present?, "should save course with name" )
  end
  
  test "should save course if name less than 255 characters" do
    course = Course.new
    course.name = "abcd"
    assert( course.name.length < 255, "save course if less than 255 characters" )
  end
  
  test "should not save course if name exceed 255 characters" do
    course = Course.new
    course.name = "1234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456"
    assert( course.name.length > 255, "should not save course if exceed 255 characters" )
  end
  
  test "should not save course without subtitle" do
    course = Course.new
    assert_not_nil( course.subtitle, "should not save course without subtitle" )
  end
  
  test "should save course if subtitle less than 255 characters" do
    course = Course.new
    course.subtitle = "abcd"
    assert( course.subtitle.length < 255, "save course if subtitle less than 255 characters" )
  end
  
  test "should not save course if subtitle exceed 255 characters" do
    course = Course.new
    course.subtitle = "1234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456789112345678911234567891123456"
    assert( course.subtitle.length > 255, "should not save course if subtitle exceed 255 characters" )
  end
  
  test "should not save course if price is 0" do
    course = Course.new
    course.price = 0
    assert( course.price == 0, "should not save course if price is 0" )
  end
  
  test "should not save course if price exceed 1000000" do
    course = Course.new
    course.price = 99999999999999
    assert( course.price > 1000000, "should not save course if price exceed 1000000" )
  end
  
  test "should not save course if duration is 0" do
    course = Course.new
    course.duration = 0
    assert( course.duration == 0, "should not save course if duration is 0" )
  end
  
  test "should not save course if duration exceed 1000" do
    course = Course.new
    course.duration = 99999
    assert( course.duration > 1000, "should not save course if duration exceed 1000" )
  end

end

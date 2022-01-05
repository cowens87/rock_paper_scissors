require "minitest/autorun"
require "minitest/pride"
require "./lib/course"
require "./lib/student"

class CourseTest < Minitest::Test
  def setup
    @course = Course.new('Calculus', 2)
    @student1 = Student.new({
                            name: 'Morgan',
                            age:  21
                          })
    @student2 = Student.new({
                            name: 'Jordan',
                            age:  29
                          })
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Course, @course
    assert_equal 'Calculus', @course.name
    assert_equal 2, @course.capacity
  end

  def test_it_can_enroll_students
    assert_equal [], @course.students
    assert_equal false, @course.full?

    @course.enroll(@student1)
    @course.enroll(@student2)

    assert_equal [@student1, @student2], @course.students
    assert_equal true, @course.full?
  end
end

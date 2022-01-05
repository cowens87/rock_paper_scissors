require "minitest/autorun"
require "minitest/pride"
require "./lib/grade_books"
require "./lib/course"
require "./lib/student"

class GradeBookTest < Minitest::Test
  def setup
    @grade_book = GradeBook.new('Ms. Lewis')
    @course_1 = Course.new('Calculus', 2)
    @course_2 = Course.new('Spanish', 4)
    @student1 = Student.new({
                            name: 'Morgan',
                            age:  21
                          })
    @student2 = Student.new({
                            name: 'Jordan',
                            age:  29
                          })
    @student3 = Student.new({
                            name: 'John',
                            age:  25
                          })
    @student4 = Student.new({
                            name: 'Rupert',
                            age:  30
                          })

  end

  def test_it_exists_and_has_attributes
    assert_instance_of GradeBook, @grade_book
    assert_equal 'Ms. Lewis', @grade_book.instructor
  end

  def test_it_can_list_courses
    assert_equal [], @grade_book.courses

    @grade_book.add_course(@course_1)
    @grade_book.add_course(@course_2)

    assert_equal [@course_1, @course_2], @grade_book.courses
  end

  def test_it_can_list_students_in_courses
    @grade_book.add_course(@course_1)
    @grade_book.add_course(@course_2)
    @course_1.enroll(@student1)
    @course_2.enroll(@student2)
    @course_1.enroll(@student3)
    @course_2.enroll(@student4)

    assert_equal [@student1, @student3], @grade_book.students_in_course(@course_1)
    assert_equal [@student2, @student4], @grade_book.students_in_course(@course_2)
  end

  def test_it_can_find_student_with_a_low_score
    @grade_book.add_course(@course_1)
    @grade_book.add_course(@course_2)
    @course_1.enroll(@student1)
    @course_2.enroll(@student2)
    @course_1.enroll(@student3)
    @course_2.enroll(@student4)
    @student1.log_scores(89)
    @student2.log_scores(78)
    @student3.log_scores(44)
    @student4.log_scores(52)

    assert_equal [@student3, @student4], @grade_book.low_scores
  end
end

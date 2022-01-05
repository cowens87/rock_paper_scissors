require "minitest/autorun"
require "minitest/pride"
require "./lib/student"

class StudentTest < Minitest::Test
  def setup
    @student = Student.new({
                            name: 'Morgan',
                            age:  21
                          })
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Student, @student
    assert_equal 'Morgan', @student.name
    assert_equal 21, @student.age
  end

  def test_it_can_log_scores
    assert_equal [], @student.scores
    @student.log_scores(89)
    @student.log_scores(78)
    assert_equal [89, 78], @student.scores
  end

  def test_it_can_find_the_average_grade
    @student.log_scores(89)
    @student.log_scores(78)
    assert_equal 83.5, @student.grade
  end
end

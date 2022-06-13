class ApplicationController < ActionController::Base
  def load_user
    if cookie['interview_student_id']
      @student = Student.find(cookie['interview_student_id'])
    else
      @student = create(:student)
      cookie['interview_student_id'] = @student.id
    end
  end

  protected

  def student
    @student
  end
end

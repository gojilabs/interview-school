class ApplicationController < ActionController::Base
  before_action :load_user

  def load_user
    if cookies['interview_student_id']
      @student = Student.find(cookies['interview_student_id'])
    else
      @student = FactoryBot.create(:student)
      cookies['interview_student_id'] = @student.id
    end
  end

  protected

  def student
    @student
  end
end

class ApplicationController < ActionController::Base
  before_action :load_user

  def load_user
    if session['interview_student_id']
      @current_student = Student.find(session['interview_student_id'])
    else
      @current_student = FactoryBot.create(:student)
      session['interview_student_id'] = @current_student.id
    end
  end

  protected

  def current_student
    @current_student
  end
end

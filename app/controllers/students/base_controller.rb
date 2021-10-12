module Students
  class BaseController < ApplicationController
    before_action :set_student

    layout 'students'

    private

    def set_student
      @student = Student.find_by(first_name: 'Brian', last_name: 'Nguyen')
    end
  end
end
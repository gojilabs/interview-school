class TeacherSubjectsController < ApplicationController
  before_action :_set_teacher_subject, only: %i[show edit update destroy]
  before_action :_set_teacher, only: %i[new create]

  def edit; end

  def show; end

  def update
    if @teacher_subject.update(_teacher_subject_params)
      render :show
    else
      render :edit
    end
  end

  def new
    @teacher_subject = TeacherSubject.new level: TeacherSubject::DEFAULT_LEVEL
  end

  def create
    @teacher_subject = TeacherSubject.new _teacher_subject_params
    @teacher_subject.teacher = @teacher
    if @teacher_subject.save
      flash[:notice] = 'Class was successfully added'
    else
      render :new
    end
  end

  def destroy
    @teacher_subject.destroy!
    flash[:notice] = 'Class was successfully removed'
  end

  private

  def _set_teacher_subject
    @teacher_subject = TeacherSubject.find params[:id]
  end

  def _set_teacher
    @teacher = Teacher.find params[:teacher_id]
  end

  def _teacher_subject_params
    params.require(:teacher_subject).permit(:level, :subject_id)
  end
end

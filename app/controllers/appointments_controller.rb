class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = student_appointments
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "my-appointments"
      end
    end
  end

  def report
    @appointments = student_appointments
    stream = loader.call(device.id, charge_history_params[:charge_ids])
    send_data stream,
              filename: "my-appointments.pdf",
              type: "application/pdf"


  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @sections = load_sections
  end

  # GET /appointments/1/edit
  def edit
    @sections = load_sections
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params.merge(student: current_student))
    @sections = Section.joins(:teacher_subject => [:teacher, :subject])
                       .where('teacher_subjects.level = :level', level: current_student.level)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /appointments/1
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find_by(id: params[:id], student: current_student)
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:section_id)
    end

  def load_sections
    Section.joins(:teacher_subject => [:teacher, :subject])
           .where('teacher_subjects.level = :level', level: current_student.level)
  end

  def student_appointments
    Appointment
      .joins(:section => {:teacher_subject => [:subject, :teacher]})
      .where(student: current_student)
  end
end

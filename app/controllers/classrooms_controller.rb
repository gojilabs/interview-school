class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[show edit update destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show; end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit; end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :floor, :building)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @students = Student.all

    json = Jbuilder.encode do |json|
      json.array! @students, :id, :name, :description, :year, :class, :imgUrl
    end
    render :json => json
  end

  def show
    render :json => student_json(@json)
  end

  def new
    @student = Student.new

  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    if @todo.save
      render :json => student_json(@json), :status => :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end

  end

  def update

      if @student.update(student_params)

        render :show, status: :ok, location: @student
      else

         render json: @student.errors, status: :unprocessable_entity
      end

  end

  def destroy
    @student.destroy
    head :no_content

  end

  private

    def student_json(student)
      Jbuilder.encode do |json|
        json.(student, :id, :name, :description, :year, :class, :imgUrl)
      end
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :description, :year, :class, :imgUrl)
    end
end

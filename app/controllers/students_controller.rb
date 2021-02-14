class StudentsController < ApplicationController

  def index
      @students = Student.search(params[:query])
# technically this worked, but the rspec didn't like it:
      # if params[:query]
      #   @students = Student.where("NAME like ?", "%#{params[:query]}%")
      #   byebug
      # else 
      #   @students = Student.all
      # end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end


  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end

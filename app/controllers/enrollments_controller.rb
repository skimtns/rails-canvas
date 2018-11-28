class EnrollmentsController < ApplicationController
  before_action :set_course

  def index
    @teachers = @course.enrollments.where(role: 'Teacher')
    @tas = @course.enrollments.where(role: 'TA')
    @students = @course.enrollments.where(role: 'Students')
  end

  def new
    @enrollment = @course.enrollments.new
  end

  def create
    @enrollment = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollment_path
    else
      render :new 
    end
  end 

  def destroy
    enrollment = @course.enrollments.find(params[:id])
    enrollment.destroy
    redirect_to course_enrollments_path
  end 

  private 
    def enrollment_params
      params.require(:enrollment).permit(:role, :user_id)
    end

    def set_course
      @course = Course.find(params[:id])
    end 
end

class TeachersController < ApplicationController
	before_action :set_teacher , only: [:edit,:update,:show,:destroy]

	def search
		@q = Teacher.ransack(params[:q])
		@teachers=@q.result.page(params[:page])
		# byebug
		render :index
	end

	def index
		@q = Teacher.ransack(params[:q])
		@teachers = @q.result.page(params[:page])
		# byebug
		# @teachers = Teacher.all.page(params[:page])
	end

	def new
		@teacher = Teacher.new 
		@subjects = Subject.all
	end

	def create
		@teacher = Teacher.new(teachers_params)
		# byebug

		 respond_to do |format|
	      if @teacher.save
	        format.html { redirect_to teacher_url(@teacher), notice: "Abc was successfully created." }
	        format.json { render :show, status: :created, location: @teacher }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	        format.json { render json: @teacher.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show
	end

	def edit
		@subjects = Subject.all.pluck(:name,:id)
		
	end

	def update
		respond_to do |format|
	      if @teacher.update(teachers_params)
	        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
	        format.json { render :show, status: :ok, location: @teacher }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	        format.json { render json: @teacher.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@teacher.destroy
		redirect_to teachers_path
	end

	private

	def teachers_params
		params.require(:teacher).permit(:name,:email,:subject_id,:contact,:experience,:address,:salary,:image)
	end

	def set_teacher
		@teacher = Teacher.find(params[:id])
	end
end
class SubjectsController < ApplicationController

	def index
		@subjects = Subject.all
		@subject = Subject.new
	end
	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subjects_params)
		if @subject.save!
			redirect_to subjects_path
		else
			render :new
		end
	end

	def show
		@subject = Subject.find(params[:id])
		@teachers = @subject.teachers.page(params[:page])
	end

	private

	def subjects_params
		params.require(:subject).permit(:name)
	end

end
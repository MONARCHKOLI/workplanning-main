class WorkersController < ApplicationController
	# http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

	def index
		@workers = Worker.all
		# render json: @workers
	end

	def show 
		@worker = Worker.find(params[:id])
		# render json: @worker
	end

	def new
		@worker = Worker.new
		# render json: @worker
	end

	def create
		@worker = Worker.create(worker_params)
		if @worker.valid?
			redirect_to @worker
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@worker = Worker.find(params[:id])
	end

	def update
		@worker = Worker.find(params[:id])
		if @worker.update(worker_params)
			redirect_to @worker
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@worker = Worker.find(params[:id])
		@worker.destroy

		redirect_to root_path, status: :see_other
	end

	private

	def worker_params
		params.require(:worker).permit(:name,:shift,:date)
	end
end

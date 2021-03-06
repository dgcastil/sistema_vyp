class UsersController < ApplicationController
	before_filter :signed_in_user

	before_filter :admin_user

	def new
		@user = User.new
	end
	def show
		@user = User.find(params[:id])
	end
	def create
		@user = User.new(params[:user])
		if @user.save
		flash[:success] = "Usuario registrado"
		redirect_to @user
		else
		render 'new'
		end
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Usuario eliminado"
		redirect_to users_path
	end
	private
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end
	end


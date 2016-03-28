class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @users = User.all.order(id: :asc)
    elsif current_user.manager?
      @users = User.where(father_id: current_user.id).order(id: :asc)
    elsif current_user.agent?
      @users = User.where(father_id: current_user.id).order(id: :asc)
    else
      @users = User.where(father_id: current_user.id).order(id: :asc)
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to controle_users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to controle_users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:father_id, :manager_id, :email, :password, :password_confirmation, :agent_id, :profile_id, :active)
    end

end

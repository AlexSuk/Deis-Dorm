class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update, :show]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} was successfully deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def create
    if(params[:password_confirmation] == params[:password])
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to root_path}
	        format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      # puts @user.icon
      if @user.update(user_params)
        # puts "UPDATE USER"
        # puts @user.icon
        format.html { redirect_to user_path(session[:user_id])}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.order(:user_name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :email, :icon)
    end

  # private
  #   def set_s3_direct_post
  #     @s3_direct_post = S3_BUCKET.presigned_post(key: "user/#{session[:user_id]}/${filename}", success_action_status: '201', acl: 'public-read')
  #   end
 end

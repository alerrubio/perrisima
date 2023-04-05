class UsersController < ActionController::API
  def index
    @users = User.all

    render json: @users.to_json
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    else
      render json: @user, status: :ok
    end
  end

  def update
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    else
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { data: 'Could not update user', error: @user.errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    else
      @user.destroy
      render json: { message: "User deleted" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number, :user_name, :user_type)
  end
end

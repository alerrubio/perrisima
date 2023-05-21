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
    @user = User.find(params[:id])
    begin
      @user.update(user_params)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue StandardError => e
      render json: { data: 'Could not update user', error: @user.errors }, status: :internal_server_error
    else
      render json: @user, status: :ok
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

  def login
    begin
      @user = User.find_by(email: params[:email])
      unless @user.blank?
        if (@user.password == params[:password])
          render json: @user, status: :ok
        else
          render json: { error: 'Wrong credentials' }, status: :unauthorized
        end
      else
        render json: { error: 'User not found' }, status: :not_found
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number, :user_name, :user_type)
  end
end

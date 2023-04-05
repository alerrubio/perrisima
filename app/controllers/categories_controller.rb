class CategoriesController < ActionController::API
  def index
    @categories = Category.all

    render json: @categories.to_json
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'category not found' }, status: :not_found
    else
      render json: @category, status: :ok
    end
  end

  def update
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'category not found' }, status: :not_found
    else
      if @category.update(category_params)
        render json: @category, status: :ok
      else
        render json: { data: 'Could not update category', error: @category.errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'category not found' }, status: :not_found
    else
      @category.destroy
      render json: { message: "category deleted" }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

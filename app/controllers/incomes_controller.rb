class IncomesController < ActionController::API
  def index
    @incomes = Income.all
    render json: @incomes.to_json
  end

  def show
    begin
      @income = Income.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Income not found' }, status: :not_found
    else
      render json: @income, status: :ok
    end
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      render json: @income, status: :created
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      @income = Income.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Income not found' }, status: :not_found
    else
      if @income.update(income_params)
        render json: @income, status: :ok
      else
        render json: { data: 'Could not update income', error: @income.errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    begin
      @income = Income.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Income not found' }, status: :not_found
    else
      @income.destroy
      render json: { message: "Income deleted" }
    end
  end

  private

  def income_params
    params.require(:income).permit(:amount, :category_id, :client_id, :user_id)
  end
end


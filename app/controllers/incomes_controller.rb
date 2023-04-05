class IncomesController < ActionController::API
  def index
    @incomes = Income.all
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      render json: @income, status: :created
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  private

  def income_params
    params.require(:income).permit(:amount, :category_id, :client_id, :user_id)
  end
end


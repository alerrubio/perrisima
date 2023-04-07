class OutcomesController < ActionController::API
  def index
    @outcomes = Outcome.all
    render json: @outcomes.to_json
  end

  def show
    begin
      @outcome = Outcome.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Outcome not found' }, status: :not_found
    else
      render json: @outcome, status: :ok
    end
  end

  def create
    @outcome = Outcome.new(outcome_params)
    if @outcome.save
      render json: @outcome, status: :created
    else
      render json: @outcome.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      @outcome = Outcome.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Outcome not found' }, status: :not_found
    else
      if @outcome.update(outcome_params)
        render json: @outcome, status: :ok
      else
        render json: { data: 'Could not update outcome', error: @outcome.errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    begin
      @outcome = Outcome.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Outcome not found' }, status: :not_found
    else
      @outcome.destroy
      render json: { message: "Outcome deleted" }
    end
  end

  private

  def outcome_params
    params.require(:outcome).permit(:amount, :category_id, :user_id)
  end

end

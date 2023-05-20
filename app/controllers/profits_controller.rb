class ProfitsController < ActionController::API
  def index
      @table = Income.all + Outcome.all
      render json: @table.to_json
  end
  
  def byFilters
      first_of_month = Date.current.beginning_of_month
      end_of_month = Date.current.end_of_month
      beg_current_year = Date.current.beginning_of_year
      end_current_year = Date.current.end_of_year
      
        @table = Income.all
      
      if params[:phone].present?
        @table = @table.joins("join clients on incomes.client_id = clients.id").where(:clients => {:phone_number => params[:phone]}) 
        @table = @table.where('incomes.created_at BETWEEN ? AND ?', first_of_month, end_of_month) if params[:month].present?
        @table = @table.where('incomes.created_at BETWEEN ? AND ?', beg_current_year, end_current_year) if params[:year].present?

        if (@table.blank?)
          render json: { error: 'Income not found' }, status: :not_found
        else
          render json: @table, status: :ok
        end

      else
        @outcomes = Outcome.all
        @table = @table.where('incomes.created_at BETWEEN ? AND ?', first_of_month, end_of_month) if params[:month].present?
        @table = @table.where('incomes.created_at BETWEEN ? AND ?', beg_current_year, end_current_year) if params[:year].present?
        @outcomes = @outcomes.where('outcomes.created_at BETWEEN ? AND ?', first_of_month, end_of_month) if params[:month].present?
        @outcomes = @outcomes.where('outcomes.created_at BETWEEN ? AND ?', beg_current_year, end_current_year) if params[:year].present?
        @table += @outcomes
        if (@table.blank?)
          render json: { error: 'Income not found' }, status: :not_found
        else
          render json: @table, status: :ok
        end

      end

      
  end

  def income_params
    params.permit(:phone, :month, :year)
  end

end

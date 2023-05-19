class ProfitsController < ActionController::API
  def index
      @table = Income.all + Outcome.all
      render json: @table.to_json
  end

  #Cambiar ruta de get a post para que pueda mandarle mas parametros en un body y no hacer tanto desmadre
  #Para aplicar varios filtros en el mismo metodo
  #if params[:dato] (el dato especifico del filtro que se manda desde el front) existe, se aplica el filtro, esto se hace en una función en secuencia del
  #más importante al menos importante.
  #Esto se checa con el if ... o .blank?
  #Todo esto  se guarda en una variable de instanica (@resultado) y eso se renderiza.
  #@filters = sdsdfsd.join(asdasdasd: efsdfsd).where(dfsd: ffsdfsd) if efsdfsd.blank?
  #@filters = efsdfsdf.where(asdasd: fdfdf => efsdfsd) if ewfefsdfs
  #Al final queda filters pues todo filtrado veda jajaja
  
  def byFilters
      first_of_month = Date.current.beginning_of_month
      end_of_month = Date.current.end_of_month
      beg_current_year = Date.current.beginning_of_year
      end_current_year = Date.current.end_of_year

      @table = Income.all

      @table = @table.joins("join clients on incomes.client_id = clients.id").where(:clients => {:phone_number => params[:phone]}) if params[:phone].present?      
      
      @table = @table.where('incomes.created_at BETWEEN ? AND ?', first_of_month, end_of_month) if params[:month].present?

      @table = @table.where('incomes.created_at BETWEEN ? AND ?', beg_current_year, end_current_year) if params[:year].present?
      
      if (@table.blank?)
        render json: { error: 'Income not found' }, status: :not_found
      else
        render json: @table, status: :ok
      end

  end

  def income_params
    params.permit(:phone, :month, :year)
  end

end

class ProfitsController < ActionController::API
  def index
      @table = Income.all + Outcome.all
      render json: @table.to_json
  end

  #Para aplicar varios filtros en el mismo metodo
  #if params[:dato] (el dato especifico del filtro que se manda desde el front) existe, se aplica el filtro, esto se hace en una función en secuencia del
  #más importante al menos importante.
  #Esto se checa con el if ... o .blank?
  #Todo esto  se guarda en una variable de instanica (@resultado) y eso se renderiza.
  #@filters = sdsdfsd.join(asdasdasd: efsdfsd).where(dfsd: ffsdfsd) if efsdfsd.blank?
  #@filters = efsdfsdf.where(asdasd: fdfdf => efsdfsd) if ewfefsdfs
  #Al final queda filters pues todo filtrado veda jajaja
  
  def byPhone
    begin
      @table = Income.joins("join clients on incomes.client_id = clients.id").where(:clients => {:phone_number => params[:phone]})
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Income not found' }, status: :not_found
    else
      if (@table.blank?)
        render json: { error: 'Income not found' }, status: :not_found
      else
        render json: @table, status: :ok
      end
    end
  end

  def byMonth
  end

  def byYear
  end


  def income_params
    params.permit(:phone, :month, :year)
  end

end

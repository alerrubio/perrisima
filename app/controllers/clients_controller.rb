class ClientsController < ActionController::API
  def index
    @clients = Client.all
    render json: @clients.to_json
  end

  def show
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Client not found' }, status: :not_found
    else
      render json: @client, status: :ok
    end
  end

  def create
    begin
      @client = Client.new(client_params)
      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :internal_server_error
      end
    rescue ActiveRecord::RecordNotUnique
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Client not found' }, status: :not_found
    else
      if @client.update(client_params)
        render json: @client, status: :ok
      else
        render json: { data: 'Could not update client', error: @client.errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Client not found' }, status: :not_found
    else
      @client.destroy
      render json: { message: "Client deleted" }
    end
  end

  def search
    begin
      @client = Client.where(phone_number: params[:phone]).first
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Client not found' }, status: :not_found
    else
      if (@client.blank?)
        render json: { error: 'Client not found' }, status: :not_found
      else
        render json: @client, status: :ok
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :phone_number)
  end

end

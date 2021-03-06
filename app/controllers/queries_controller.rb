class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]
  before_filter :is_admin


  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.all
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    #create client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "MrFwvZUWLSjHMOZbUUTNh6DhV"
      config.consumer_secret     = "YFulSMlkkrOSgsFXumM0afBb9oMJJXj1W2HS98NlzGaxHujSwO"
      config.access_token        = "763403619236446208-PGfCCSNRvmvKbbDLVNdtrMjHKzw7wmB"
      config.access_token_secret = "aKwhG67BWl7H5mnRg2q6IX2uymFV7ew2nkaJaj7lff21A"
    end
    name = @query.name
    @tweets ||= @client.search("#{name} -rt", :result_type => "popular")
  end

  # GET /queries/new
  def new
    @query = Query.new
  end

  # GET /queries/1/edit
  def edit
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(query_params)

    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1
  # PATCH/PUT /queries/1.json
  def update
    respond_to do |format|
      if @query.update(query_params)
        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { render :show, status: :ok, location: @query }
      else
        format.html { render :edit }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to queries_url, notice: 'Query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query = Query.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.require(:query).permit(:name)
    end
end

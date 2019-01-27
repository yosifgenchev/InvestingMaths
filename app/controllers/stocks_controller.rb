class StocksController < ApplicationController
  before_action :authenticate_user!, :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    #@stocks = Stock.includes(:stats).order("stats.dividend_yield DESC")
    @stocks = Stock.all.sort_by(&:last_dividend_yield).reverse!
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
    authorize @stock
    if @stock.edit(stock_params)
      flash[:notice] = "\"#{@stock.symbol}\" was successfully updated."
      redirect_to @stock
    else
      flash.now[:alert] = "There was an error updating the stock."
      render :index
    end
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update

    @stock = Stock.find(params[:id])
    authorize @stock
    
    if @stock.update(stock_params)
      flash[:notice] = "\"#{@stock.symbol}\" was successfully updated."
      redirect_to @stock
    else
      flash.now[:alert] = "There was an error updating the stock."
      render :index
    end

    # respond_to do |format|
    #   if @stock.update(stock_params)
    #     format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @stock }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @stock.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    authorize @stock
    
    if @stock.destroy
      flash[:notice] = "\"#{@stock.symbol}\" was successfully deleted."
      redirect_to @stock
    else
      flash.now[:alert] = "There was an error deleting the stock."
      render :index
    end


    # @stock.destroy
    # respond_to do |format|
    #   format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:symbol, :company_name)
    end
end

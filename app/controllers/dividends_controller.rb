class DividendsController < ApplicationController
  before_action :authenticate_user!, :authorization, :set_dividend, only: [:show, :edit, :update, :destroy]

  # GET /dividends
  # GET /dividends.json
  def index
    @dividends = Dividend.all
  end

  # GET /dividends/1
  # GET /dividends/1.json
  def show
  end

  # GET /dividends/new
  def new
    @dividend = Dividend.new
  end

  # GET /dividends/1/edit
  def edit
  end

  # POST /dividends
  # POST /dividends.json
  def create
    @dividend = Dividend.new(dividend_params)

    respond_to do |format|
      if @dividend.save
        format.html { redirect_to @dividend, notice: 'Dividend was successfully created.' }
        format.json { render :show, status: :created, location: @dividend }
      else
        format.html { render :new }
        format.json { render json: @dividend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dividends/1
  # PATCH/PUT /dividends/1.json
  def update
    respond_to do |format|
      if @dividend.update(dividend_params)
        format.html { redirect_to @dividend, notice: 'Dividend was successfully updated.' }
        format.json { render :show, status: :ok, location: @dividend }
      else
        format.html { render :edit }
        format.json { render json: @dividend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dividends/1
  # DELETE /dividends/1.json
  def destroy

    @dividend = Dividend.find(params[:id])
    authorize @dividend
    
    if @dividend.destroy
      flash[:notice] = "\"#{@dividend.symbol}\" was successfully deleted."
      redirect_to @dividend
    else
      flash.now[:alert] = "There was an error deleting the dividend."
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dividend
      @dividend = Dividend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dividend_params
      params.require(:dividend).permit(:amount, :stock_id)
    end

    private

    def authorization
      authorize(Dividend)
    end
end

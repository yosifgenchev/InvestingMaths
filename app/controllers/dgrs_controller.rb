class DgrsController < ApplicationController
  before_action :set_dgr, only: [:show, :edit, :update, :destroy]

  # GET /dgrs
  # GET /dgrs.json
  def index
    @dgrs = Dgr.all
  end

  # GET /dgrs/1
  # GET /dgrs/1.json
  def show
  end

  # GET /dgrs/new
  def new
    @dgr = Dgr.new
  end

  # GET /dgrs/1/edit
  def edit
  end

  # POST /dgrs
  # POST /dgrs.json
  def create
    @dgr = Dgr.new(dgr_params)

    respond_to do |format|
      if @dgr.save
        format.html { redirect_to @dgr, notice: 'Dgr was successfully created.' }
        format.json { render :show, status: :created, location: @dgr }
      else
        format.html { render :new }
        format.json { render json: @dgr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dgrs/1
  # PATCH/PUT /dgrs/1.json
  def update
    respond_to do |format|
      if @dgr.update(dgr_params)
        format.html { redirect_to @dgr, notice: 'Dgr was successfully updated.' }
        format.json { render :show, status: :ok, location: @dgr }
      else
        format.html { render :edit }
        format.json { render json: @dgr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dgrs/1
  # DELETE /dgrs/1.json
  def destroy
    @dgr.destroy
    respond_to do |format|
      format.html { redirect_to dgrs_url, notice: 'Dgr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dgr
      @dgr = Dgr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dgr_params
      params.require(:dgr).permit(:dgr_1, :dgr_3, :dgr_5, :dgr_10, :mr_inc, :stock_id)
    end
end

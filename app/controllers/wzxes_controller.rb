
class WzxesController < ApplicationController
  before_action :set_wzx, only: [:show, :edit, :update, :destroy]

  # GET /wzxes
  # GET /wzxes.json
  def find
  x = params[:x]
  y = params[:y]
  # distance =params[:distance]
  #{distance}
  data = Wzx.where("pt<->point'(#{x},#{y})'<5").order("pt<->point'(#{x},#{y})'").first
    # data1 =(id: data_id)
  render json:data
   
end
  def index
    @wzxes = Wzx.all
  end

  # GET /wzxes/1
  # GET /wzxes/1.json
  def show
  end

  # GET /wzxes/new
  def new
    @wzx = Wzx.new
  end

  # GET /wzxes/1/edit
  def edit
  end

  # POST /wzxes
  # POST /wzxes.json
  def create
    @wzx = Wzx.new(wzx_params)

    respond_to do |format|
      if @wzx.save
        format.html { redirect_to @wzx, notice: 'Wzx was successfully created.' }
        format.json { render :show, status: :created, location: @wzx }
      else
        format.html { render :new }
        format.json { render json: @wzx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wzxes/1
  # PATCH/PUT /wzxes/1.json
  def update
    respond_to do |format|
      if @wzx.update(wzx_params)
        format.html { redirect_to @wzx, notice: 'Wzx was successfully updated.' }
        format.json { render :show, status: :ok, location: @wzx }
      else
        format.html { render :edit }
        format.json { render json: @wzx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wzxes/1
  # DELETE /wzxes/1.json
  def destroy
    @wzx.destroy
    respond_to do |format|
      format.html { redirect_to wzxes_url, notice: 'Wzx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wzx
      @wzx = Wzx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wzx_params
      params.require(:wzx).permit(:name, :information, :food, :tuijian)
    end
end

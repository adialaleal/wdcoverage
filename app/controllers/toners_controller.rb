class TonersController < ApplicationController
  before_action :set_toner, only: [:show, :edit, :update, :destroy]

  # GET /toners
  # GET /toners.json
  def index
    @toners = Toner.all
  end

  # GET /toners/1
  # GET /toners/1.json
  def show
    # Porcentual padrão de área de cobertura.
    pdefault = 5.00
    # Transformação dos níveis de toner para integer
    nvl_i = @toner.nvl_ini * 100
    nvl_e = @toner.nvl_end * 100
    # Calculo da produção dentro do período especificado.
    prod = @toner.count_end.to_i - @toner.count_ini.to_i
    # Calculo da quantidade inicial de páginas tomando como peça de calculo o nível inicial * o rendimento esperado do toner
    amount_ini = (@toner.nvl_ini.to_f * @toner.tyield.to_f)
    # Calculo da quantidade final de páginas tomando como peça de calculo o nível final * o rendimento esperado do toner
    amount_end = (@toner.nvl_end.to_f * @toner.tyield.to_f)
    # Calculo do real rendimento julgando os níveis especificados de toner.
    ryield = (amount_ini - amount_end)
    # Calculo da área de cobertura do toner especificado.
    @coverage = (ryield * pdefault) / prod.to_f
    @description = "Este relatório tomou como base o toner com um nível inicial de #{nvl_i.to_i}%,
     correspondente à #{amount_ini} páginas, e seu nível final de #{nvl_e.to_i}% correspondendo à #{amount_end} páginas.
     Este intervalo corresponde ao rendimento de #{amount_ini.to_i - amount_end.to_i} páginas."
    @result = "No intervalo informado, foram feitas #{prod} páginas, com uma área de cobertura de #{@coverage}%."
    
  end

  # GET /toners/new
  def new
    @toner = Toner.new
  end

  # GET /toners/1/edit
  def edit
  end

  # POST /toners
  # POST /toners.json
  def create
    @toner = Toner.new(toner_params)

    respond_to do |format|
      if @toner.save
        format.html { redirect_to @toner, notice: 'Registro adicionado com sucesso!' }
        format.json { render :show, status: :created, location: @toner }
      else
        format.html { render :new }
        format.json { render json: @toner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toners/1
  # PATCH/PUT /toners/1.json
  def update
    respond_to do |format|
      if @toner.update(toner_params)
        format.html { redirect_to @toner, notice: 'Registro editado com sucesso!' }
        format.json { render :show, status: :ok, location: @toner }
      else
        format.html { render :edit }
        format.json { render json: @toner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toners/1
  # DELETE /toners/1.json
  def destroy
    @toner.destroy
    respond_to do |format|
      format.html { redirect_to toners_url, notice: 'Registro excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toner
      @toner = Toner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toner_params
      params.require(:toner).permit(:client, :device, :serial_number, :part_number, :tcolor, :tyield, :count_ini, :count_end, :nvl_ini, :nvl_end, :date_in, :date_out)
    end
end

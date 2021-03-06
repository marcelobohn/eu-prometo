class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy, :follow]
  before_action :set_types, only: [:show, :new, :create, :edit]
  before_action :authenticate_user!

  def follow
    f = @manager.start_follow current_user
    # render json: { success: f ? true : false, follow: f }
  end

  # GET /managers
  # GET /managers.json
  def index
    @managers = Manager.page params[:page]
    authorize @managers
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
    redirect_to manager_promises_path(@manager)
  end

  # GET /managers/new
  def new
    @manager = Manager.new
    @manager.election_id = 2
    @manager.type_manager = 0
  end

  # GET /managers/1/edit
  def edit
  end

  # POST /managers
  # POST /managers.json
  def create
    @manager = Manager.new(manager_params)
    @manager.user = current_user
    @manager.country_id = 1
    @manager.state = @manager.city.state

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    def set_types
      # @type_manager = [['Presidente(a)', 2], ['Governador(a)', 1], ['Prefeito(a)', 0]]
      @type_manager = [['Prefeito(a)', 0]]
      @states = State.all.order(:name).collect { |c| [ c.abbrev, c.id ] }
      @cities = (@manager && @manager.type_manager && @manager.type_manager == 0) ? @manager.state.cities.all.order(:name).collect { |c| [ c.name, c.id ] } : {}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:name, :election_id, :country_id, :state_id, :city_id, :type_manager, :start, :end, :user_id)
    end
end

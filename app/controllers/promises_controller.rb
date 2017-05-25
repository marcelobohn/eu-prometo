class PromisesController < ApplicationController
  before_action :set_promise, only: [:show, :edit, :update, :destroy, :finish]
  before_action :authenticate_user!, :except => [:show, :index]

  # GET /promises
  # GET /promises.json
  def index
    # @promises = Promise.all
    @manager = Manager.find(params[:manager_id])
    @promises = @manager.promise.all
  end

  # GET /promises/1
  # GET /promises/1.json
  def show
  end

  # GET /promises/new
  def new
    @manager = Manager.find(params[:manager_id])
    @promise = Promise.new
    @promise.manager = @manager
  end

  # GET /promises/1/edit
  def edit
  end

  def finish
    @finishing = true
    @promise.date_finish = Time.now.strftime("%Y-%m-%d")  
  end

  # POST /promises
  # POST /promises.json
  def create
    @promise = Promise.new(promise_params)
    @promise.user = current_user

    respond_to do |format|
      if @promise.save
        format.html { redirect_to manager_promises_path(@promise.manager), notice: 'Promise was successfully created.' }
        format.json { render :show, status: :created, location: @promise }
      else
        format.html { render :new }
        format.json { render json: @promise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promises/1
  # PATCH/PUT /promises/1.json
  def update
    if !promise_params['description_finish'].nil?
      @promise.finish(promise_params['description_finish'], current_user.id)
      redirect_to manager_promises_path(@manager), notice: 'Promise was successfully finished.'
    else
      respond_to do |format|
        if @promise.update(promise_params)
          format.html { redirect_to manager_promises_path(@manager), notice: 'Promise was successfully updated.' }
          format.json { render :show, status: :ok, location: @promise }
        else
          format.html { render :edit }
          format.json { render json: @promise.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /promises/1
  # DELETE /promises/1.json
  def destroy
    @promise.destroy
    respond_to do |format|
      format.html { redirect_to manager_promises_path(@promise.manager), notice: 'Promise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promise
      @manager = Manager.find(params[:manager_id])
      @promise = Promise.find(params[:id] || params[:promise_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promise_params
      params.require(:promise).permit(:manager_id, :description, :date_finish, :description_finish, :user_id, :user_finish)
    end
end

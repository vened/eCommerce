module Staff
  class ConfigsController < StaffController
    before_action :set_config, only: [:show, :edit, :update, :destroy]

    # GET /configs
    # GET /configs.json
    def index
      @config = Config.first

      respond_to do |format|
        if @config.blank?
          format.html { redirect_to :new_staff_config, notice: 'Config was successfully created.' }
        else
          format.html { render :index }
        end
      end

    end


    # GET /configs/1
    # GET /configs/1.json
    def show
    end


    # GET /configs/new
    def new
      @config = Config.new
    end


    # GET /configs/1/edit
    def edit
    end


    # POST /configs
    # POST /configs.json
    def create
      @config = Config.new(config_params)

      respond_to do |format|
        if @config.save
          format.html { redirect_to staff_configs_path, notice: 'Config was successfully created.' }
          format.json { render :show, status: :created, location: staff_configs_path }
        else
          format.html { render :new }
          format.json { render json: @config.errors, status: :unprocessable_entity }
        end
      end
    end


    # PATCH/PUT /configs/1
    # PATCH/PUT /configs/1.json
    def update
      respond_to do |format|
        if @config.update(config_params)
          format.html { redirect_to staff_configs_path, notice: 'Config was successfully updated.' }
          format.json { render :show, status: :ok, location: staff_configs_path }
        else
          format.html { render :index }
          format.json { render json: @config.errors, status: :unprocessable_entity }
        end
      end
    end


    # DELETE /configs/1
    # DELETE /configs/1.json
    def destroy
      @config.destroy
      respond_to do |format|
        format.html { redirect_to configs_url, notice: 'Config was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:sitename, :google_analytics, :google_analytics_counter_id, :scripts)
    end
  end
end

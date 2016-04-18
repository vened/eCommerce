module Staff
  class ConfigsController < StaffController
    before_action :set_config, only: [:update]

    def index
      @config = Config.first

      respond_to do |format|
        if @config.blank?
          format.html { redirect_to :new_staff_config, alert: 'Настройки в базе данных не обнаружены!' }
        else
          format.html { render :index }
        end
      end
    end

    def new
      @config = Config.new
    end

    def create
      @config = Config.new(config_params)

      respond_to do |format|
        if @config.save
          format.html { redirect_to staff_configs_path, notice: 'Настройки успешно созданны и сохранены.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @config.update(config_params)
          format.html { redirect_to staff_configs_path, notice: 'Настройки успешно обновлены.' }
        else
          format.html { render :index }
        end
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

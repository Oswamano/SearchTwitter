class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]
  before_filter :is_admin

  # GET /settings
  # GET /settings.json
  def index
      @settings = Setting.all
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/1/edit
  def edit
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
      respond_to do |format|
          if @setting.update(setting_params)
              format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
              format.json { render :show, status: :ok, location: @setting }
          else
              format.html { render :edit }
              format.json { render json: @setting.errors, status: :unprocessable_entity }
          end
      end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
      if @setting.destroy
          respond_to do |format|
              format.html { redirect_to settings_url, notice: 'Setting was successfully destroyed.' }
              format.json { head :no_content }
          end
      end
  end

  private
      
      def set_setting
          # Use callbacks to share common setup or constraints between actions.
          @setting = Setting.where(id: params[:id]).first
          if !@setting
              redirect_to settings_url
          end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def setting_params
          params.require(:setting).permit(:setting_category, :setting_key, :setting_value)
      end
end


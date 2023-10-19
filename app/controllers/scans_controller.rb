class ScansController < ApplicationController
  before_action :set_scan, only: [:show, :update, :destroy]

  # GET /scans
  def index
    @scans = Scan.all

    render json: @scans.to_json
  end

  # GET /scans/1
  def show
    crit_arr = []
    @scan.criteria.each do |crit|
      variable_obj = {}
      crit.variables.as_json.each do |var|
        variable_obj[var["identifier"]] = {type: var["type"], url: var["url"]}.merge(var["properties"])
      end
      crit_arr.push(crit.as_json.merge({variable: variable_obj}))
    end
    result = @scan.as_json.merge({"criteria": crit_arr})
    render json: result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan
      @scan = Scan.includes(:criteria).where(url:  params[:id]).first
    end

    # Only allow a list of trusted parameters through.
    def scan_params
      params.require(:scan).permit(:name, :tag, :color)
    end
end

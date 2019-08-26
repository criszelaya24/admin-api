class TimeRecordsController < ApplicationController
  before_action :authenticate_user
  before_action :is_admin?, only: [:create, :index]
  before_action :set_time_record, only: [:show, :update, :destroy]

  def find_user_time_record
    @user_time_record = TimeRecord.where(user_id: params[:user_id])
    render json: @user_time_record, status: 200
  end
  # GET /time_records
  def index
    @time_records = TimeRecord.all

    render json: @time_records
  end

  # GET /time_records/1
  def show
    render json: @time_record
  end

  # POST /time_records
  def create
    @time_record = TimeRecord.new(time_record_params)

    render json: @time_record, status: :created, location: @time_record if @time_record.save
    render json: @time_record.errors, status: :unprocessable_entity unless @time_record.save
  end

  # PATCH/PUT /time_records/1
  def update
    render json: @time_record if @time_record.update(time_record_params)
    render json: @time_record.errors, status: :unprocessable_entity unless @time_record.update(time_record_params)
  end

  # DELETE /time_records/1
  def destroy
    @time_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_record
      @time_record = TimeRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_record_params
      params.require(:time_record).permit(:user_id, :date, :entrance, :output)
    end
end

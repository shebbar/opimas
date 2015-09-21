class ReportSubscribersController < ApplicationController
  before_action :set_report_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /report_subscribers
  # GET /report_subscribers.json
  def index
    @report_subscribers = ReportSubscriber.all
  end

  # GET /report_subscribers/1
  # GET /report_subscribers/1.json
  def show
  end

  # GET /report_subscribers/new
  def new
    @report_subscriber = ReportSubscriber.new
    @salesguys = Employee.includes(:roles).where('roles.name' => 'Sales')
  end

  # GET /report_subscribers/1/edit
  def edit
    @salesguys = Employee.includes(:roles).where('roles.name' => 'Sales')
  end

  # POST /report_subscribers
  # POST /report_subscribers.json
  def create
    @report_subscriber = ReportSubscriber.new(report_subscriber_params)

    respond_to do |format|
      if @report_subscriber.save
        format.html { redirect_to @report_subscriber, notice: 'Report subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @report_subscriber }
      else
        format.html { render :new }
        format.json { render json: @report_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_subscribers/1
  # PATCH/PUT /report_subscribers/1.json
  def update
    respond_to do |format|
      if @report_subscriber.update(report_subscriber_params)
        format.html { redirect_to @report_subscriber, notice: 'Report subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @report_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_subscribers/1
  # DELETE /report_subscribers/1.json
  def destroy
    @report_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to report_subscribers_url, notice: 'Report subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_subscriber
      @report_subscriber = ReportSubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_subscriber_params
      params.require(:report_subscriber).permit(:company_id, :contract_start_date, :contract_end_date, :contract_currency, :contract_value, report_ids: [], employee_ids: [])
    end
end

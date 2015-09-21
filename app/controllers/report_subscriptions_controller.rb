class ReportSubscriptionsController < ApplicationController
  before_action :set_report_subscription, only: [:show, :edit, :update, :destroy]

  # GET /report_subscriptions
  # GET /report_subscriptions.json
  def index
    @report_subscriptions = ReportSubscription.all
  end

  # GET /report_subscriptions/1
  # GET /report_subscriptions/1.json
  def show
  end

  # GET /report_subscriptions/new
  def new
    @report_subscription = ReportSubscription.new
  end

  # GET /report_subscriptions/1/edit
  def edit
  end

  # POST /report_subscriptions
  # POST /report_subscriptions.json
  def create
    @report_subscription = ReportSubscription.new(report_subscription_params)

    respond_to do |format|
      if @report_subscription.save
        format.html { redirect_to @report_subscription, notice: 'Report subscription was successfully created.' }
        format.json { render :show, status: :created, location: @report_subscription }
      else
        format.html { render :new }
        format.json { render json: @report_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_subscriptions/1
  # PATCH/PUT /report_subscriptions/1.json
  def update
    respond_to do |format|
      if @report_subscription.update(report_subscription_params)
        format.html { redirect_to @report_subscription, notice: 'Report subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_subscription }
      else
        format.html { render :edit }
        format.json { render json: @report_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_subscriptions/1
  # DELETE /report_subscriptions/1.json
  def destroy
    @report_subscription.destroy
    respond_to do |format|
      format.html { redirect_to report_subscriptions_url, notice: 'Report subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_subscription
      @report_subscription = ReportSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_subscription_params
      params.require(:report_subscription).permit(:report_id, :report_subscriber_id)
    end
end

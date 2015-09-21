class CategorySubscribersController < ApplicationController
  before_action :set_category_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /category_subscribers
  # GET /category_subscribers.json
  def index
    @category_subscribers = CategorySubscriber.all
  end

  # GET /category_subscribers/1
  # GET /category_subscribers/1.json
  def show
  end

  # GET /category_subscribers/new
  def new
    @category_subscriber = CategorySubscriber.new
    @salesguys = Employee.includes(:roles).where('roles.name' => 'Sales')
  end

  # GET /category_subscribers/1/edit
  def edit
    @salesguys = Employee.includes(:roles).where('roles.name' => 'Sales')
  end

  # POST /category_subscribers
  # POST /category_subscribers.json
  def create
    @category_subscriber = CategorySubscriber.new(category_subscriber_params)

    respond_to do |format|
      if @category_subscriber.save
        format.html { redirect_to @category_subscriber, notice: 'Category subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @category_subscriber }
      else
        format.html { render :new }
        format.json { render json: @category_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_subscribers/1
  # PATCH/PUT /category_subscribers/1.json
  def update
    respond_to do |format|
      if @category_subscriber.update(category_subscriber_params)
        format.html { redirect_to @category_subscriber, notice: 'Category subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @category_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_subscribers/1
  # DELETE /category_subscribers/1.json
  def destroy
    @category_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to category_subscribers_url, notice: 'Category subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_subscriber
      @category_subscriber = CategorySubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_subscriber_params
      params.require(:category_subscriber).permit(:company_id, :contract_start_date, :contract_end_date, :contract_currency, :contract_value, category_ids: [], employee_ids: [])
    end
end

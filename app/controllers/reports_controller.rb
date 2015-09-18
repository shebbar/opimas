class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    add_parent_categories (params[:report][:category_ids])
    @report = Report.create(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    add_parent_categories (params[:report][:category_ids])
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :summary, :publication_date, :press_release, :main_report, :charts, :vid, employee_ids: [], category_ids: [])
    end

    def add_parent_categories (catarrays)
      paramarray = catarrays
        catarrays.each do |catarr|
          if Category.exists?(catarr)
            @count = 1
            catObj = Category.find(catarr)
            unless catObj.parent_id.nil?
              parentcatObj = Category.find(catObj.parent_id)
              paramarray <<  parentcatObj.id
              unless parentcatObj.parent_id.nil?
                mastercatObj = Category.find(parentcatObj.parent_id)
                paramarray <<  mastercatObj.id
              end
            end
          end
        end
        params[:report][:category_ids] = paramarray.uniq
    end
end

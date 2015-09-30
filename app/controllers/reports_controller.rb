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

    def add_parent_categories(catarrays)
      @paramarray = catarrays
      unless catarrays.all? &:blank?
        catarrays.length.times do |i|
          check_category_parent(catarrays[i])
        end
      end
      params[:report][:category_ids] = @paramarray.uniq
    end

    def check_category_parent(catid)
      unless catid.blank?
        @paramarray << catid
        @catObj = Category.find(catid)
        check_category_parent(@catObj.parent_id) unless @catObj.parent_id.nil?
      end
    end

    def handle_attachment_uploads_outside_rails
      params[:report][:vid] = nil
      params[:report][:main_report] = nil
      params[:report][:charts] = nil

      params[:report][:press_release] = nil
    end

    def update_attachments
      @report.update(vid_file_name: "#{@report_title}_video.mp4", vid_content_type: "video/mp4", vid_file_size: "4000000", vid_updated_at: @pub_date,
                    press_release_file_name: "#{@report_title}_pr.pdf", press_release_content_type: "application/pdf", press_release_file_size: "100000", press_release_updated_at: @pub_date,
                    main_report_file_name: "#{@report_title}_main.pdf", main_report_content_type: "application/pdf", main_report_file_size: "250000", main_report_updated_at: @pub_date,
                    charts_file_name: "#{@report_title}_data.xlsx", charts_content_type: "application/vnd.ms-excel", charts_file_size: "100000", charts_updated_at: @pub_date)
    end
end

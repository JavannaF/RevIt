class ReportsController < ApplicationController
  before_action :set_report, only: [:destroy]
  before_action :exist_report , only: :create 
  before_action :admin_user, only: [:index,:destroy]
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all.order("created_at DESC")
  end

  # GET /reports/new
  def new
    @report = Report.new
    
  end

  # POST /reports
  # POST /reports.json
  def create
    @review=Review.find(params[:reported_id])
    @report = Report.new(report_params)
    @user=User.find(params[:reporter_id])
 
    
      if @report.save
           @review.passive_reports<<@report
    @user.active_reports<<@report
        flash[:success] = "report created!"
        redirect_to "/items/"+@review.item.id.to_s
      else
        redirect_to :root
      end
    
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    flash[:success] = "report deleted"
    redirect_to reports_url
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    def exist_report
         @review=Review.find(params[:reported_id])
         @item=@review.item
         @user=current_user
         
          if @review.passive_reports.exists?(['reporter_id LIKE ?',params[:reporter_id]])
           redirect_to "/items/"+@item.id.to_s
        end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.permit(:reported_id, :reporter_id)
    end
    def admin_user
      if current_user!=nil
      redirect_to(root_url) unless current_user.admin?
      else redirect_to(root_url) 
      end
    end
 
end

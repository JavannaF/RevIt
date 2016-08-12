class AddsController < ApplicationController
  before_action :logged_in_owner, only: [:create, :destroy, :update]
  before_action :correct_owner,   only: :destroy


  def create
    @add = current_owner.adds.build(add_params)
    if @add.save
      flash[:success] = "Add created!"
      redirect_to root_url
    else
      @feed_adds =[]
      render 'static_pages/home'
    end
  end

  def destroy
    @add.destroy
    flash[:success] = "Add deleted"
    redirect_to request.referrer || root_url

  end

  private

    def add_params
      params.require(:add).permit(:name, :description, :price, :picture)
    end

    def correct_owner
      @add = current_owner.adds.find_by(id: params[:id])
      redirect_to root_url if @add.nil?
    end
end

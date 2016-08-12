class ReviewsController < ApplicationController
 
  
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @user = User.find(params[:id])
    @reviews = @user.review.paginate(page: params[:page])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  #def create
   # @review = Review.new(review_params)

   # respond_to do |format|
   #   if @review.save
   #     format.html { redirect_to @review, notice: 'Review was successfully created.' }
    #    format.json { render :show, status: :created, location: @review }
   #   else
  #      format.html { render :new }
  #      format.json { render json: @review.errors, status: :unprocessable_entity }
   #   end
  #  end
 # end
  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.create(review_params)
    redirect_to item_path(@item)
  end


  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.find(params[:id])
    @reviews.destroy
    redirect_to item_path(@item)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :price, :rating, :store)
    end
end

class EvaluationsController < ApplicationController
   def new
    @evaluation = Evaluation.new
    end
    def create
        params[:user_id]=current_user.id
        @owner=Owner.find(params[:owner_id])
        @evaluation= Evaluation.new(evaluation_params)
        @owner.passive_evaluations<<@evaluation
        current_user.active_evaluations<<@evaluation

    if @evaluation.save
      #flash[:success] = "item created!"
      redirect_to @owner#show
    else
      
      redirect_to :root
    end

   
    end
    private
       def evaluation_params
        params.permit(:value,:owner_id,:user_id) 
     end   
end

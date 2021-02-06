class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
    # binding.pry  
      redirect_to prototype_path(@comment.prototype_id)
    else
      # @prototype = Prototype.find(params[:id])
      # @prototype = Prototype.find(params[:prototype_id])
      # @prototype = Prototype.find_by(params[user_id: params[:user_id]])   
      # @comments = Comment.all
      # render template: "prototypes/show"

      @prototype = @comment.prototype #>>>>>>>>> できなかった  @comment.ptoroype >> ptorotype
      @comments = @prototype.comments #>>>>>>>>> できなかった

      render "prototypes/show"

    end

  end


  private
  
  def comment_params
    params.require(:comment).permit(:text).merge( user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
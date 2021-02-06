class PrototypesController < ApplicationController
  # before_action :set_prototype, only: [:edit, :show]
  # before_action :move_to_index,except: :index
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    # @prototypes = Prototype.all
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # binding.pry
    @prototype = Prototype.new(prototype_params)
    #  binding.pry
    if @prototype.save        # saveはアクティブレコードメソッド
      redirect_to root_path   # "保存成功"
    else
      render :new   #"保存失敗"
    end
  end

  def destroy
    # @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      render :show
    end

  end

  # def edit
  #   @prototype = Prototype.find(params[:id])
  # end

  def edit
  end

  def show
    # @prototype = Prototype.find(params[:id])
    # binding.pry
    @comment = Comment.new
    # @comments = @prototype.comments.includes(:user)
    @comments = @prototype.comments
  end

  def update
    # binding.pry
    # prototype = Prototype.find(params[:id])
    # if prototype.update(prototype_params)
    #   redirect_to prototype_path(prototype)
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation
    # binding.pry
    redirect_to root_path unless current_user == @prototype.user
  end
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def prototype_params    #取得したいキーをpermitで調整 >>>>> 指定したキーのみ取得
    # params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end

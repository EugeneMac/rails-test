class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def new
    @post = Post.new
    @post.user = current_user
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
    redirect_to @post
    else
      render 'new'
    end
  end
  
  def index
    #@posts = Post.paginate(:page => params[:page], :per_page => 5)
    if (params.has_key?(:tag))
     @posts =  Post.joins(:tags).where("tags.name =?", params[:tag]).paginate(:page => params[:page], :per_page => 5) 
    else
     @posts = Post.paginate(:page => params[:page], :per_page => 5)
    end 
  end  
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
 
  respond_to do |format|
     if @post.user != current_user
       format.html { redirect_to @post, notice: 'That post is not yours to edit' }
       format.json { render json: @post.errors, status: :unprocessable_entity }
     elsif @post.update_attributes(params[:post])
       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
       format.json { head :no_content }
     else
       format.html { render action: "edit" }
       format.json { render json: @post.errors, status: :unprocessable_entity }
     end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.user != current_user
     flash[:notice] = 'That post is not yours to destory'

     respond_to do |format|
       format.html { redirect_to :back }
       format.json { head :no_content }
     end
   else
     @post.destroy

     respond_to do |format|
       format.html { redirect_to posts_url }
       format.json { head :no_content }
     end
  end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end

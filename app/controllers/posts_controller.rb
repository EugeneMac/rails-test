class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post].permit(:title, :text))
 
    if @post.save
    redirect_to @post
    else
      render 'new'
    end
  end
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
    
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
    if @post.update_attributes(params[:post])
      format.html  { redirect_to(@post,
                    :notice => 'Post was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
    end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end
    
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end

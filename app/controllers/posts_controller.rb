class PostsController < ApplicationController
  
  def home
    render json: { list_files: $drive.list_files }
  end

  def set_google_drive_token
    if request['code'] == nil
      redirect_to($drive.authorization_url)
    else
      $drive.save_credentials(request['code'])
      redirect_to('/')
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
    HttpRequest.new.request
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_attached_image)
  end
end

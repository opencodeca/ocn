class App::CommentsController < App::ApplicationController
  before_action :fetch_comment, only: [:show, :like]

  # POST /comments/new
  def create
    unless current_user
      return redirect_to :back, alert: t('.not_signed_in')
    end

    @comment = current_user.comments.build
    @comment.assign_attributes(comment_params)

    if @comment.save
      url = :back
      url = app_post_path(@comment.commentable) if @comment.commentable.is_a?(Post)

      current_user.like_comment!(@comment)

      if @comment.commentable_type == "Comment"
        original_commentable = fetch_original_commentable
        original_commentable.class.name.constantize.increment_counter(:comments_count, original_commentable.id)
      end

      redirect_to url, notice: t('.notice')
    else
      render :new
    end
  end

  # GET /comments/:id
  def show
    @comments = @comment.comments
  end

  # POST /comments/:id/like
  def like
    current_user.like_comment!(@comment)
    redirect_to :back
  end

private

  def fetch_original_commentable
    current_commentable = Comment.find(@comment.commentable_id)

    until current_commentable.commentable_type != "Comment" do
      current_commentable = Comment.find(current_commentable.commentable_id)
    end

    current_commentable.commentable_type.constantize.find(current_commentable.commentable_id)
  end

  def fetch_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    permitted_parameters = [:comment, :commentable_id, :commentable_type]
    params.require(:comment).permit(*permitted_parameters)
  end
end

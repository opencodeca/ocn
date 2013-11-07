module App
  class CommentsController < AppController
    before_action :fetch_comment, only: [:show, :like]

    # POST /comments/:id/like
    def like
      current_user.express!(:like, @comment)
      redirect_to :back
    end

  private

    def fetch_comment
      @comment = Comment.find(params[:id])
    end
  end
end

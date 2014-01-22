class PostDeleter
  def initialize(post)
    @post = post
    @user = post.user
  end

  def run!
    if @post.virgin? && @post.destroy
      decrement_submitter_karma
    end
  end

private

  def decrement_submitter_karma
    @user.decrement!(:karma)
  end
end

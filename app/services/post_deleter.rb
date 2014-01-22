class PostDeleter
  def initialize(user, post)
    @post = post
    @user = user
    @submitter = post.user
  end

  def run!
    if destroyed?
      decrement_submitter_karma
    else
      false
    end
  end

private

  def destroyed?
    if @post.virgin? && (@submitter == @user)
      @post.destroy
    end
  end

  def decrement_submitter_karma
    @user.decrement!(:karma)
  end
end

class PostDeleter
  def initialize(user, post)
    @post = post
    @user = user
    @submitter = post.user
  end

  def run!
    if destroyed?
      remove_emotion
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

  def remove_emotion
    @user.no_longer_express!(:like, @post)
    @user.decrement!(:karma)
  end
end

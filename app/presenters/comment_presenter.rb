class CommentPresenter < Bourgeois::Presenter
  # Return a link element to the author profile page
  def author_link
    view.link_to commenter.username, view.app_user_path(commenter)
  end

  # Return the up vote link
  def upvote_link(user)
    if !user.like_about?(object)
      view.link_to '▲', view.like_app_comment_path(self), method: :post
    end
  end

  # Return the localized score
  def points_count
    view.t('.points_count', count: like_emotions_count)
  end
end

class CommentPresenter < Bourgeois::Presenter
  # Return a link element to the author profile page
  def author_link
    view.link_to commenter.username, view.app_user_path(commenter)
  end

  # Return the localized score
  def points_count
    view.t('.points_count', count: like_emotions_count)
  end
end

class CommentPresenter < Bourgeois::Presenter
  # Return a link element to the author profile page
  def author_link
    view.link_to commenter.username, view.app_user_path(commenter.username)
  end
end

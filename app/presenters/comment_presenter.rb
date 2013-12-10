class CommentPresenter < Bourgeois::Presenter
  include ERB::Util

  helper :with_comments, if: -> { comments.any? }

  # Return a link element to the author profile page
  def author_link
    view.link_to commenter.username, view.app_user_path(commenter)
  end

  # Return the up vote link
  def upvote_link(user)
    if user && !user.like_about?(object)
      view.link_to '▲', view.like_app_comment_path(self), method: :post
    end
  end

  # Return the localized score
  def points_count
    view.t('.points_count', count: like_emotions_count)
  end

  # Return the formatted comment
  def formatted_comment
    view.simple_format(view.parse_links(escaped_comment))
  end

protected

  def escaped_comment
    h(comment)
  end
end

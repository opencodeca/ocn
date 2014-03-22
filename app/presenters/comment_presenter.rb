class CommentPresenter < Bourgeois::Presenter
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

  def formatted_comment(format = :text)
    case format
    when :markdown
      to_md(comment)
    else
      view.simple_format(comment)
    end
  end

end

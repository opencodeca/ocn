class PostPresenter < Bourgeois::Presenter
  helper :with_description, if: -> { description.present? }
  helper :with_url, if: -> { url.present? }

  # Return the domain part of the post URL
  def domain
    url.split('/')[2]
  end

  # Return the localized score
  def points_count
    view.t('.points_count', count: like_emotions_count)
  end

  # Return the localized comments count
  def comments_count
    label = view.t('.comments_count', count: super)
    view.link_to label, view.app_post_path(object)
  end

  # Return a link element to the author profile page
  def author_link
    view.link_to user.username, view.app_user_path(user)
  end

  # Return the up vote link
  def upvote_link(user)
    if user && !user.like_about?(object)
      view.link_to '▲', view.like_app_post_path(self), method: :post
    end
  end

  # Return the formatted description
  def formatted_description(format = :text)
    case format
    when :markdown
      to_md(description)
    else
      view.simple_format(description)
    end
  end
end

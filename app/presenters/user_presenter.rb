class UserPresenter < Bourgeois::Presenter
  def github_profile_url
    "https://github.com/#{username}"
  end

  def profile_picture
    view.image_tag "https://www.gravatar.com/avatar/#{gravatar_id}" if gravatar_id
  end
end

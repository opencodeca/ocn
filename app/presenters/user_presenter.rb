class UserPresenter < Bourgeois::Presenter
  def github_profile_url
    "https://github.com/#{username}"
  end

  def profile_picture
    "https://www.gravatar.com/avatar/#{gravatar_id}?s=150" if gravatar_id
  end
end

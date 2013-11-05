class UserPresenter < Bourgeois::Presenter
  def github_profile_url
    "https://github.com/#{username}"
  end
end

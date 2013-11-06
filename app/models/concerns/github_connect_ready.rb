module GithubConnectReady
  extend ActiveSupport::Concern

  module ClassMethods
    def find_for_github_oauth(auth, signed_in_resource=nil)
      where(provider: auth.provider, uid: auth.uid).first_or_create({
        name: auth.extra.raw_info.name,
        username: auth.extra.raw_info.login,
        email: auth.info.email,
        provider: auth.provider,
        uid: auth.uid,
        gravatar_id: auth.extra.raw_info.gravatar_id
      })
    end
  end

end

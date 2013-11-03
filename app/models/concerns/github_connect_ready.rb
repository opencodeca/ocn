module GithubConnectReady
  extend ActiveSupport::Concern

  module ClassMethods
    def find_for_github_oauth(auth, signed_in_resource=nil)
      obj = where(:provider => auth.provider, :uid => auth.uid).first

      unless obj
        attr = {
          name: auth.extra.raw_info.name,
          username: auth.extra.raw_info.login,
          provider: auth.provider,
          uid: auth.uid,
          password: Devise.friendly_token[0,20]
        }
        attr.merge! email: auth.info.email if auth.info.email.present?

        obj = create(attr)
      end

      obj
    end
  end

end

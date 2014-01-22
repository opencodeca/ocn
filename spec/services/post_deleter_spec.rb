require 'spec_helper'

describe PostDeleter do
  let(:user) { create(:user, karma: 8 ) }
  let(:post) { create(:url_post, user: user) }

  before { PostDeleter.new(post).run! }

  it { expect(user.karma).to eq(7) }
  it { expect(Post.count).to eq(0) }
end

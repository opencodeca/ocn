require 'spec_helper'

describe PostDeleter do
  let(:submitter) { create(:user, karma: 8 ) }
  let(:post) { create(:url_post, user: submitter) }

  context 'submitter is requester' do
    before { PostDeleter.new(submitter, post).run! }

    it { expect(submitter.karma).to eq(7) }
    it { expect(Post.count).to eq(0) }
  end

  context 'requester is someone else' do
    let(:dumbass) { create(:user) }

    before { PostDeleter.new(dumbass, post).run! }

    it { expect(submitter.karma).to eq(8) }
    it { expect(Post.count).to eq(1) }
  end
end

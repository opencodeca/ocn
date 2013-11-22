require 'spec_helper'

describe User do

  describe :Factories do
    context "Valid factory" do
      subject { create(:user) }
      specify { should be_valid }
    end

    context "Invalid factory" do
      subject { build(:invalid_user) }
      specify { should_not be_valid }
    end
  end

  describe "#like_post!" do
    let(:liker)  { create(:user) }
    let(:author) { create(:user, karma: 0) }
    let(:post)   { create(:url_post, user: author) }

    context "with blank post" do
      before { liker.like_post!(post) }

      it "expresses like emotion" do
        expect(liker.like_about?(post)).to be_true
      end

      it "increments author's karma" do
        expect(author.karma).to eq(1)
      end
    end

    context "when user already liked post" do
      let(:post) do
        create(:url_post, user: author).tap { |post| liker.like_post!(post) }
      end

      it "raises User::DoubleLikeError" do
        expect { liker.like_post!(post) }.to raise_error(User::DoubleLikeError)
      end
    end
  end
end

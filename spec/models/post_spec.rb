require 'spec_helper'

describe Post do

  describe :Factories do
    context "Valid factory" do
      subject { create(:post) }
      specify { should be_valid }
    end

    context "Invalid factory" do
      subject { build(:invalid_post) }
      specify { should_not be_valid }
    end
  end

  describe :metadata do
    subject { Post.new }
    let(:valid_document) do
      OpenStruct.new({
        title: 'Test',
        description: 'Nice description',
      })
    end

    before do
      MetadataFetcher.any_instance.stub(:document).and_return(valid_document)
      subject.save(validate: false)
    end

    context :populate_metadata do
      it { expect(subject.metadata["title"]).to eq(valid_document.title) }
    end
  end
end

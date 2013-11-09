require 'spec_helper'

describe Comment do
  let(:valid_document) do
    OpenStruct.new({
      title: 'Test',
      description: 'Nice description',
    })
  end

  before do
    MetadataFetcher.any_instance.stub(:document).and_return(valid_document)
  end

  describe :Factories do
    context "Valid factory" do
      subject { create(:comment) }
      specify { should be_valid }
    end

    context "Invalid factory" do
      subject { build(:invalid_comment) }
      specify { should_not be_valid }
    end
  end
end

require 'spec_helper'

describe Post do

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

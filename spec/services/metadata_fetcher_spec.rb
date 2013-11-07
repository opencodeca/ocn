require 'spec_helper'

describe MetadataFetcher do
  subject { MetadataFetcher.new url }

  context :valid_document do
    let(:url) { 'https://github.com/peterc/pismo' }
    let(:output) { subject.as_json }
    let(:valid_document) do
      OpenStruct.new({
        title: 'Test',
        description: 'Nice description',
        body: 'This is my body',
        html_body: 'This is my <p>html</p> body',
        keywords: ['oh', 'my', 'god'],
        sentences: 'This is a cool link',
        author: 'Myself',
        datetime: Time.now
      })
    end

    before do
      MetadataFetcher.any_instance.stub(:document).and_return(valid_document)
    end

    it { expect(output[:title]).to eq(valid_document.title) }
    it { expect(output[:description]).to eq(valid_document.description) }
    it { expect(output[:body]).to eq(valid_document.body) }
    it { expect(output[:html_body]).to eq(valid_document.html_body) }
    it { expect(output[:keywords]).to eq(valid_document.keywords) }
    it { expect(output[:sentences]).to eq(valid_document.sentences) }
    it { expect(output[:author]).to eq(valid_document.author) }
    it { expect(output[:datetime]).to eq(valid_document.datetime) }
  end
end

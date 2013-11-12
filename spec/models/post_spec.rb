require 'spec_helper'

describe Post do

  describe :Factories do
    context "Valid factory" do
      subject { create(:url_post) }
      specify { should be_valid }
    end

    context "Invalid factory" do
      subject { build(:invalid_post) }
      specify { should_not be_valid }
    end
  end
end

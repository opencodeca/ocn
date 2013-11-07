require 'spec_helper'

describe Comment do

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

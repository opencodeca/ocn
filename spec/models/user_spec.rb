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
end

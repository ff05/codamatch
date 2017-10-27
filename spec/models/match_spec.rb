require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:student1) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:student2) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:date) }
  end

end

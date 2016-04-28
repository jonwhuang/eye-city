require 'rails_helper'

RSpec.describe Return, type: :model do

  let(:manufacturer) { create(:test_manufacturer) }
  let(:brand) { create(:test_brand) }
  let(:new_return) { build(:test_return) }

  describe 'validations' do
    context 'will raise an error' do

    end

    it 'saves the product when all required fields are provided' do
      expect{new_return.save}.to change{Return.count}.by(1)
    end
  end
end

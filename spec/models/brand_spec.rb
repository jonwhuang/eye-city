require 'rails_helper'

RSpec.describe Brand, type: :model do

  let(:invalid_brand) { Brand.new() }
  let(:brand) { build(:test_brand) }
  let(:repeat_brand) { build(:test_brand) }

  describe 'validations' do
    it 'will raise an error when the name field is empty' do
      invalid_brand.save
      expect(invalid_brand.errors[:name]).to include("can't be blank")
    end
    it 'saves the brand on valid name entry' do
      expect{brand.save}.to change{Brand.count}.by(1)
    end
    it 'does not allow a non-unique brand to be saved' do
      brand.save
      repeat_brand.save
      expect(repeat_brand.errors[:name]).to include("has already been taken")
    end
  end

end

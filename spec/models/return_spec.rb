require 'rails_helper'

RSpec.describe Return, type: :model do

  let(:manufacturer) { create(:test_manufacturer) }
  let(:brand) { create(:test_brand) }
  let(:new_return) { build(:test_return) }
  let(:no_auth_return) { build(:test_return, auth_number: "")}
  let(:no_date_return) { build(:test_return, return_date: "")}
  let(:no_frame_return) { build(:test_return, frame_count: "")}
  let(:zero_frame_return) { build(:test_return, frame_count: 0)}
  let(:no_brand_return) { build(:test_return, brand_id: "")}
  let(:no_manufacturer_return) { build(:test_return, manufacturer_id: "")}


  describe 'validations' do
    context 'will raise an error' do
      it 'when authorization number is empty' do
        no_auth_return.save
        expect(no_auth_return.errors[:auth_number]).to include("can't be blank")
      end

      it 'when the return authorization date is empty' do
        no_date_return.save
        expect(no_date_return.errors[:return_date]).to include("can't be blank")
      end

      it 'when the frame count is empty' do
        no_frame_return.save
        expect(no_frame_return.errors[:frame_count]).to include("can't be blank")
      end

      it 'when the frame count is 0' do
        no_frame_return.save
        expect(no_frame_return.errors[:frame_count]).to include("must be greater than or equal to 1")
      end

      it 'when no brand is selected' do
        no_brand_return.save
        expect(no_brand_return.errors[:brand_id]).to include("can't be blank")
      end

      it 'when no manufacturer is selected' do
        no_manufacturer_return.save
        expect(no_manufacturer_return.errors[:manufacturer_id]).to include("can't be blank")
      end
    end

    it 'saves the product when all required fields are provided' do
      expect{new_return.save}.to change{Return.count}.by(1)
    end
  end
end

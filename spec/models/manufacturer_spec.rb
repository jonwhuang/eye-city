require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  let(:invalid_manufacturer) { Manufacturer.new() }
  let(:manufacturer) { build(:test_manufacturer) }
  let(:repeat_manufacturer) { build(:test_manufacturer) }

  describe 'validations' do
    it 'will raise an error when the name field is empty' do
      invalid_manufacturer.save
      expect(invalid_manufacturer.errors[:name]).to include("can't be blank")
    end
    it 'saves the manufacturer on valid name entry' do
      expect{manufacturer.save}.to change{Manufacturer.count}.by(1)
    end
    it 'does not allow a non-unique manufacturer to be saved' do
      manufacturer.save
      repeat_manufacturer.save
      expect(repeat_manufacturer.errors[:name]).to include("has already been taken")
    end
  end

end

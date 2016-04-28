require 'rails_helper'

RSpec.describe ManufacturersController, type: :controller do

  let (:admin) { create(:admin) }
  before(:each) do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns @manufacturers' do
      manufacturer = create(:test_manufacturer)
      get :index
      expect(assigns[:manufacturers]).to eq [manufacturer]
    end

    it 'should load all manufacturers ordered by name' do
      create(:test_manufacturer)
      create(:test_manufacturer, name: "test2")
      get :index
      expect(assigns[:manufacturers]).to eq Manufacturer.all.order(:name)
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the correct manufacturer to @manufacturer' do
      manufacturer = create(:test_manufacturer)
      get :show, id: manufacturer
      expect(assigns[:manufacturer]).to eq manufacturer
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end

    it 'assigns manufacturer\'s brands to @brands' do
      brand1 = create(:test_brand)
      brand2 = create(:test_brand, name: "test2")
      manufacturer = create(:test_manufacturer)
      manufacturer.brands << brand1 << brand2
      get :show, id: manufacturer
      expect(assigns[:brands]).to eq [brand1, brand2]
    end
  end


end

FactoryGirl.define do
  factory :test_manufacturer, class: Manufacturer do
    name "test manufacturer"
  end

  factory :test_brand, class: Brand do
    name "test brand"
  end

  factory :test_return, class: Return do
    auth_number "test"
    return_date "2016-01-01"
    brand_id 1
    manufacturer_id 1
    frame_count 1
  end
end

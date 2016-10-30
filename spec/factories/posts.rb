include ActionDispatch::TestProcess
FactoryGirl.define do

    factory :post do
      created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
      updated_at {Faker::Time.between(2.days.ago, Time.now, :all)}
      message {Faker::Lorem.paragraph }
    end


    trait :text_image do
      text_image { fixture_file_upload("spec/fixtures/img/sample.jpeg") }
    end

end

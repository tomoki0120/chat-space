include ActionDispatch::TestProcess
FactoryGirl.define do

    factory :post do
      created_at {Faker::Date.between(2.days.ago, Date.today)}
      updated_at {Faker::Date.between(2.days.ago, Date.today)}
    end

    trait :message do
      message {Faker::Lorem.sentence }
    end


    trait :text_image do
      text_image { fixture_file_upload("spec/fixtures/img/sample.jpeg") }
    end

end

FactoryGirl.define do


    factory :group do
      group_name {Faker::Name.name}
      created_at {Faker::Date.between(2.days.ago, Date.today)}
      updated_at {Faker::Date.between(2.days.ago, Date.today)}
    end

end

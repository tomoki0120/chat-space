include ActionDispatch::TestProcess
FactoryGirl.define do

    factory :post do
      extend ActionDispatch::TestProcess
      id               1
      message         'テスト'
      user_id          1
      group_id         2
      created_at      '2016-10-24 13:36:59'
      updated_at      '2016-10-24 13:36:59'
      text_image { fixture_file_upload("spec/fixtures/img/sample.jpeg") }
    end
end

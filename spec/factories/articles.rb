FactoryBot.define do
  factory :article do
    title { 'test_title1' }
    content { 'test_content１' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/IMG_7827.jpg')) }
    country { 'アメリカ' }
    address { 'アメリカ' }
  end
  factory :second_article, class: Article do
    title { 'test_title2' }
    content { 'test_content ２' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/IMG_7827.jpg')) }
    country { 'メキシコ' }
    address { 'メキシコ' }
  end
  factory :third_article, class: Article do
    title { 'test_title 3' }
    content { 'test_content 3' }
    image {"./app/assets/images/IMG_7835.jpg"}
    country { 'カナダ' }
    address { 'バンクーバー' }
  end
end

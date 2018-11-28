FactoryBot.define do
  factory :page_with_resource, :parent => :page do
    after_create { |p| p.resources << Factory(:resource) }
  end

  factory :blog_post_with_resource, :parent => :blog_post do
    after_create { |b| b.resources << Factory(:resource) }
  end if defined? Refinery::Blog::Post
end

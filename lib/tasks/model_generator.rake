namespace :model_generator do
  desc "TODO"
  # task populate: :environment do |task, args|
  task :populate, [:product_num, :user_num] => [:environment] do |task, args|
    args.with_defaults(product_num: 2, user_num: 2)
    users = FactoryGirl.create_list :user, args.user_num
    products = FactoryGirl.create_list :product, args.product_num

    products.each do |p|
      users.each do |u|
        FactoryGirl.create :modifier, user: u, product: p
      end
    end

  end
end
namespace :model_generator do
  desc 'Populates database for development'

  # task populate: :environment do |task, args|
  task :populate, [:product_num, :user_num] => [:environment] do |_task, args|
    args.with_defaults(product_num: 2, user_num: 2)
    users = FactoryGirl.create_list :user, args.user_num
    products = FactoryGirl.create_list :product, args.product_num

    products.each do |p|
      users.each do |u|
        FactoryGirl.create :modifier, user: u, product: p
      end
    end
  end

  task :populate_product, [:prod_id, :user_num] => [:environment] do |_task, args|
    args.with_defaults(prod_id: 1, user_num: 5)
    p = Product.find(args.prod_id)
    users = FactoryGirl.create_list :user, args.user_num
    users.each do |u|
      FactoryGirl.create :modifier, user: u, product: p
    end
  end
end

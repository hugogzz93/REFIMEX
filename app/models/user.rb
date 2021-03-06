class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum credentials: [:client, :admin]

  has_many :modifiers, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, through: :modifiers

  def self.credential_list
    %w(client admin)
  end

  def products
    Product.where(users: {id: self.id}).joins(modifiers: :user).distinct
  end

  def modifiers
    Modifier.where(user_id: self.id)
            .order(:product_id, created_at: :desc)
            .select('distinct on (product_id) *')
  end

  def modifier_for(product)
    modifiers.find_by(product_id: product.id)
  end
end

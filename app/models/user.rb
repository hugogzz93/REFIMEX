class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum credentials: [:client, :admin]

  has_many :modifiers
  has_many :products, through: :modifiers

  def credential_list
    ["Client", "Admin"]
  end
end

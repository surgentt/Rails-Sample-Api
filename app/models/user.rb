class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum role: [:customer, :admin]
  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true

  has_many :orders
  has_many :menu_items, through: :order_menu_items

  def set_default_role
    self.role ||= :customer
  end

end

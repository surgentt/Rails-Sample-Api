class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:customer, :admin]
  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true

  def set_default_role
    self.role ||= :customer
  end

end

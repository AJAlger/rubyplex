class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable, :lockable

  has_many :sketches, dependent: :destroy

  validates :role, presence: true, inclusion: { in: %w{standard pro admin}, message: "should be one of admin, pro, standard" }
  validates :username, length: { minimum: 3}, presence: true
  validates :name, length: {minimum: 3}, presence: true

  def admin?
    role == "admin"
  end

  def pro?
    role == "pro"
  end

  def standard?
    role == "standard"
  end

  def upgradeable?
    self.standard?
  end

  def downgradeable?
    self.pro?
  end

  def upgrade_account
    if self.upgradeable?
      self.update_attributes(role: "pro")
    end
  end

  def downgrade_account
    if self.downgradeable?
      self.update_attributes(role: "standard")
    end
  end

  # downgradeable saved for users who do not pay the monthly fee. Their account will be downgraded. If users opt out of the monthly payment, they can also choose to downgrade their account.

end

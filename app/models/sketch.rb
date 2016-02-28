class Sketch < ActiveRecord::Base

  belongs_to :user

  before_create :generate_slug

  validates :title, length: { minimum: 1 }, presence: true
  validates :body, presence: true

  default_scope { order("created_at DESC")}

  private

  def generate_slug
    self.slug = SecureRandom.hex(10)
  end

end

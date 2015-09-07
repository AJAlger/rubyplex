class Sketch < ActiveRecord::Base

  belongs_to :user

  before_create :generate_slug



  private

  def generate_slug
    self.slug = SecureRandom.urlsafe_base64(10)
  end

end

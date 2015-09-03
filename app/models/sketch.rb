class Sketch < ActiveRecord::Base

  belongs_to :user

  # after_create :generate_permalink
  #
  # private
  #
  # def generate_permalink
  #   self.permalink = SecureRandom.urlsafe_base64(10)
  # end

end

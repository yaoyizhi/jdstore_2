class Product < ApplicationRecord
  validates_presence_of :title, :friendly_id
  validates_presence_of :friendly_id
  validates_format_of :friendly_id, with: /\A[a-z0-9\-]+\z/

  mount_uploader :imager, ImageUploader

  before_validation :generate_friendly_id, on: :create

  def to_param
    friendly_id
  end

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end
end

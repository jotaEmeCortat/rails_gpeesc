class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    slug
  end
end

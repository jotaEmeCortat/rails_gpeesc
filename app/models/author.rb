class Author < ApplicationRecord
  DEGREES = %w[Associado Mestre Doutor Pós-Doutor]
  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_param
    slug
  end
end

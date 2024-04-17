class Author < ApplicationRecord
    QUALIFICATIONS = %w[Associado Mestre Doutor Pós-Doutor]
  has_many :repositories
  has_many :publications, through: :repositories, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_param
    slug
  end
end

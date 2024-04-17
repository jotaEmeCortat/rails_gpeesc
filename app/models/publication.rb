class Publication < ApplicationRecord
  THEMES = %w[bullying corpo educação esporte idosos ]
  TYPES = %w[artigo cartilha dissertação livro tese]
  has_many :repositories
  has_many :authors, through: :repositories

  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    slug
  end
end

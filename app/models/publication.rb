class Publication < ApplicationRecord
  THEMES = %w[bullying corpo educação esporte idosos ]
  CATEGORIES = %w[artigo dissertação tese]

  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    slug
  end
end

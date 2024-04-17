class Repository < ApplicationRecord
  belongs_to :author
  belongs_to :publication
end

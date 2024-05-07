# app/models/repository.rb
class Repository < ApplicationRecord
  belongs_to :publication
  belongs_to :author
end

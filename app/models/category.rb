# frozen_string_literal: true
class Category < ApplicationRecord

  has_many :tasks

  scope :sorted, -> { order(:name) }

end

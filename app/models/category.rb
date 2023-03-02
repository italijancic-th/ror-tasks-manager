# frozen_string_literal: true
class Category < ApplicationRecord

  # For dependent we use nullify, because category is an optional on task
  has_many :tasks, dependent: :nullify

  validates_length_of :name, within: 2..50

  scope :sorted, -> { order(:name) }

end

# frozen_string_literal: true

class User < ApplicationRecord
  validates :password, presence: true
  validates :password_confirmation, presence: false
  validate :must_match
  def authenticate(passowrd)
    password == passowrd ? self : false
  end

  private

  def must_match
    true if password == password_confirmation
  end

  def user_valid?
    if password && password_confirmation && password == password_confirmation
      true
    end
  end
end

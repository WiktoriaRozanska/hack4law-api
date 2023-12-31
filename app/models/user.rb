# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save -> { skip_confirmation! }

  belongs_to :organization

  enum :role, { super_admin: 'super_admin', admin: 'admin', guest: 'guest' }.freeze
end

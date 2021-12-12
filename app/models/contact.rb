class Contact < ApplicationRecord
  
  enum subject: [:app, :develop, :other]
  
  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :matter, presence: true
  
end

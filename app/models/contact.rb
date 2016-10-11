class Contact < ApplicationRecord
  validates :name, :age, :email, :occupation, presence: true

  belongs_to :state
end

class SandwichImage < ApplicationRecord
  belongs_to :sandwich
  attachment :image
end

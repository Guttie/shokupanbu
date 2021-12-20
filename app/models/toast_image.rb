class ToastImage < ApplicationRecord
  belongs_to :toast
  attachment :image
end

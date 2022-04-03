class UserProfile < ApplicationRecord
  belongs_to :user

  enum gender: { male: 0, female: 1, other: 2, didnt_tell:3 }
  enum deficient_description: {visual: 0, motor: 1, mental: 2,
                               hearing: 3, cerebral_palsy: 4}
  enum marital_status: { single: 0, married: 1, divorced: 2,
                         widower: 3, separate: 4, stable_union: 5}
end

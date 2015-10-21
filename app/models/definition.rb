class Definition < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :meaning, presence: true

  attachment :profile_image, type: :image

  def self.search(search)
    where("word like ? or meaning like ?", "%#{search}%", "%#{search}%")
  end
end

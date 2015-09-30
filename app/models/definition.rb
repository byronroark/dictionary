class Definition < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :meaning, presence: true

  def self.search(search)
    where("word LIKE ?", "#{search}")
  end
end

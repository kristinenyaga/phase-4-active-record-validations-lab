class Post < ApplicationRecord

  validates :content, presence: true,length:{minimum: 250}
  validates :title, presence: true
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :title_is_clickbait

  def title_is_clickbait
    if !(["Won't Believe","Secret","Top [number]","Guess"].any?{|phrase|"#{title}".include?(phrase)})
      errors.add(:title, "not clickbaity")
    end
  end
end


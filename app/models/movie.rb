class Movie < ApplicationRecord
  belongs_to :user

   validates :title,presence: true
   validates :body,presence: true, length: { maximum: 200}

  has_many :favorites, dependent: :destroy

def self.looks(search, word)
    if search == "perfect_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @movie = Movie.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @movie = Movie.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @movie = Movie.where("title LIKE?","%#{word}%")
    else
      @movie = Movie.all
    end
end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

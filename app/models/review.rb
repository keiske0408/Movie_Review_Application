class Review < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  belongs_to :movie
  belongs_to :user

  validates :content, presence: true
  validates :movie_id, presence: true
  validates :user_id, presence: true

  def destroy
    update(deleted_at: Time.now)
  end

end




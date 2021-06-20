class Story < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged

  include AASM

  # validations
  validates :title, presence: true

  # relationships
  belongs_to :user
  has_one_attached :cover_image
  has_many :comments

  # scopes
  # default_scope { where(deleted_at: nil) } 使用 paranoia 不需要了
  # scope :published_stories, -> { where(status: 'published') }
  # 使用 aasm 不用寫 scope
  scope :published_stories, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user) }

  # instance methods 使用 paranoia 不需要了
  # def destroy
  #   update(deleted_at: Time.now)
  # end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end
end

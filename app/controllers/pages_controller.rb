class PagesController < ApplicationController
  def index
    # 只顯示上架的文章（不會顯示草稿）
    # @stories = Story.order(created_at: :desc).includes(:user)
    # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
    # @stories = Story.published_stories.order(created_at: :desc).includes(:user)
    # @stories = Story.published.order(created_at: :desc).includes(:user)
    # @stories = Story.published.with_attached_cover_image.order(created_at: :desc).includes(:user)
    @stories = Story.published_stories
  end

  def show
  end

  def user
  end
end

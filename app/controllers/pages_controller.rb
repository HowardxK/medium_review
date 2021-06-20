class PagesController < ApplicationController
  before_action :find_story, only: [:show]

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
    @comment = @story.comments.new
    @comments = @story.comments.order(id: :desc)
  end

  def user
  end

  private
  
  def find_story
    @story = Story.friendly.find(params[:story_id])
  end
end

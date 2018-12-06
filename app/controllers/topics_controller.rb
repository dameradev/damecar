class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end

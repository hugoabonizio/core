class EpisodesController < ApplicationController
  def show
    episode = Rails.cache.fetch("episodes/#{channel_slug}/#{episode_slug}---2", expires_in: 1.day) do
      puts "MISS"
      a = Episode.includes(:channel).find_for(channel_slug, episode_slug)
      a.channel
      a.next
      a.decorate
    end

    @episode = episode
  end

  def list
    @episodes = Episode.order_by(published_at: :desc).page(page).per(24).decorate
  end

  private

  def channel_slug
    params[:channel]
  end

  def episode_slug
    params[:episode]
  end

  def page
    params[:page]
  end
end

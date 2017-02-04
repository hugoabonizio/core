class CategoriesController < ApplicationController
  def list
    categories = Rails.cache.fetch("categories", expires_in: 10.minutes) do
      Category.all.entries
    end
    @categories = CategoriesDecorator.new(categories)
  end

  def show
    @category = Rails.cache.fetch("categories/#{slug}", expires_in: 10.minutes) do
      Category.find(params[:category]).decorate
    end

    channels = Rails.cache.fetch("categories/#{slug}/channels", expires_in: 10.minutes) do
      @category.channels.listed.order_by(created_at: :desc).entires
    end

    @channels = ChannelsDecorator.new(channels)
  end

  private

  def slug
    params[:category]
  end
end

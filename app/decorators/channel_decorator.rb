class ChannelDecorator < ApplicationDecorator
  decorates_association :categories
  decorates_association :episodes

  def summary
    ""
  end
end

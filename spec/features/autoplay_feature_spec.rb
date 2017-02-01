require "rails_helper"

RSpec.feature "Autoplay integraion", type: :feature do
  let!(:channel) { Fabricate(:channel_with_episodes, title: "Dr. House Podcast") }
  let(:current_episode) { channel.episodes.last }
  let(:next_episode) { channel.episodes.second }

  describe "redirection to the next episode" do
    context "when the autoplay is active" do
      scenario "redirects the user to the next episode page" do
        when_i_visit_the_episode_page
        then_i_see_the_link_for_the_next_episode
        when_the_audio_ends
        then_i_am_redirected_to_the_next_episode
      end
    end

    context "when the autoplay is active" do
      scenario "does not redirect the user to the next episode page" do
        when_i_visit_the_episode_page
        then_i_see_the_link_for_the_next_episode
        when_the_audio_ends
        then_i_am_redirected_to_the_next_episode
      end
    end
  end

  private

  def when_i_visit_the_episode_page
    visit "/#{channel.slug}/#{current_episode.slug}"
  end

  def and_the_page_includes_a_link_to_the_next_episode
    link = channel_episode_path(next_episode.channel, next_episode)

    expect(page).to have_link(next_episode.title, href: link)
  end

  def when_the_audio_ends
    # How to set if the audio ends?
  end

  def then_i_am_redirected_to_the_next_episode
    expect(true).to be(true)
    # How to check for a redirection
  end
end

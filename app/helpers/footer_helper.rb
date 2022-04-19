# frozen_string_literal: true

module FooterHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noreferrer noopener'
  end
end

module FooterHelper
    def current_year
      Time.zone.now.year
    end

    def github_url(author, repo)
      "https://github.com/#{author}/#{repo}"
    end
  end
class GistQuestionService
  GIST_TOKEN = ENV.fetch('GIST_TOKEN')

  Response = Struct.new(:url) do
    def success?
      !!url
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    Response.new(response.html_url)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: GIST_TOKEN)
  end

end
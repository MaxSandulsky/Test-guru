class GistQuestionService
  GITHUB_TOKEN = Rails.application.credentials.github_token
  ResultStruct = Struct.new(:status, :url) do
    def success?
      status == 201
    end
  end

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call
    result = @client.create_gist(gist_params)
    ResultStruct.new(@client.last_response.status, result[:html_url])
  end

  private

  def gist_params
    {
      description: I18n.t('.gist.description'),
      files: {
        I18n.t('.gist.file_title') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end

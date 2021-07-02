class GistQuestionService
  GITHUB_TOKEN = Rails.application.credentials.github

  def initialize(question, github_token)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  rescue Octokit::Unauthorized
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

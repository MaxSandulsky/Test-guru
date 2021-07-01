class GistQuestionService
  def initialize(question, github_token, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: github_token)
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

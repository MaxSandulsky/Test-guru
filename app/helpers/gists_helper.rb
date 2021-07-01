module GistsHelper
  def gist_hash(string)
    string.delete 'https://gist.github.com/'
  end
end

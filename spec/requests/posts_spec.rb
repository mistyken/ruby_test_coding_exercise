require_relative '../../PostsAPIClient'
require_relative '../support/api_schema_matcher'
require 'json'

RSpec.describe PostsApiClient do
  let(:posts_response) { PostsApiClient.posts() }
  describe 'Get Posts' do
    it 'returns correctly some posts data' do
      expect(posts_response.status).to be_equal(200)

      data = JSON.parse(posts_response.body, symbolize_names: true)
      expect(data).to be_kind_of(Array)
      expect(data[0]).to have_key(:userId)
      expect(data[0]).to have_key(:id)
      expect(data[0]).to have_key(:title)
      expect(data[0]).to have_key(:body)

      expect(data[0][:userId]).to be_kind_of(Integer)
      expect(data[0][:id]).to be_kind_of(Integer)
      expect(data[0][:title]).to be_kind_of(String)
      expect(data[0][:body]).to be_kind_of(String)
    end

    it 'passes the schema validation' do
      expect(posts_response.status).to be_equal(200)
      expect(posts_response).to match_response_schema('posts')
    end
  end
end
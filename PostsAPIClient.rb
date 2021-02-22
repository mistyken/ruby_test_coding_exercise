require "faraday"
require "json"

class PostsApiClient
    def self.posts()
      url = "https://jsonplaceholder.typicode.com/posts"
      Faraday.get(url)
    end
   end
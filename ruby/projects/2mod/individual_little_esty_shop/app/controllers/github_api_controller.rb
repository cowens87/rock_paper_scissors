class GithubApiController < ApplicationController
  def show
    # connection = Faraday.new('https://api.github.com')
    # response   = connection.get('/repos/foymikek/little-esty-shop/stats/contributors')
    # results = JSON.parse(response.body, symbolize_names: true)
    # @github_results = results.map do |user_data|
    #   GithubResults.new(user_data)
    # end
    @github_results = GithubFacade.get_users
  end
end

#Session Rules 
# the new exist so that there is a login page 
# create authenticartes the actual user 
# destroy ends the session or logs out
# no strong params for sessions
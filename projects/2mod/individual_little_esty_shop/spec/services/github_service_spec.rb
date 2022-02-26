require 'rails_helper'

describe GithubService do
  context "instance methods" do
    it "can make API call to database", :vcr do
      # query = GithubService.call_github('/repos/cowens87')
      params = {org: 'lulu-jubu'}
      query = GithubService.call_github("/orgs/#{params[:org]}/repos")
      require 'pry'; binding.pry
      repo_data = query[:results].first
      expect(query).to be_a Hash
      expect(repo_data).to be_a Hash
      expect(repo_data).to have_key :title
    end
  end
end
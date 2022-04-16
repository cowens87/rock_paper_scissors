# frozen_string_literal: true

require 'rails_helper'

describe "Users's Excursions Index Endpoint" do
  describe 'GET users/:id/excursions' do
    it 'can fetch all excursion for a user' do
      user = User.create(id: 1).id
      create_list(:excursion, 6, user_id: user)

      get "/api/v1/users/#{user}/excursions"

      user_excursions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(user_excursions.count).to eq(6)

      user_excursions.each do |user_excursion|
        check_hash_structure(user_excursion, :type, String)

        excursion_details = user_excursion[:attributes]

        check_hash_structure(excursion_details, :title, String)
        check_hash_structure(excursion_details, :description, String)
        check_hash_structure(excursion_details, :location, String)
        check_hash_structure(excursion_details, :user_id, Integer)
      end
    end
  end
end

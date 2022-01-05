# frozen_string_literal: true

require 'rails_helper'

describe 'excursions' do
  it 'can update an excursions' do
    user = User.create(id: 1)

    excursion = create(:excursion, user_id: user.id)
    previous_name = Excursion.last.title
    excursion_params = { title: 'Excursion303' }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/users/#{user.id}/excursions/#{excursion.id}", headers: headers, params: JSON.generate(excursion: excursion_params)

    updated_excursion = Excursion.find_by(id: excursion.id)
    expect(response).to be_successful
    expect(updated_excursion.title).to_not eq(previous_name)
    expect(updated_excursion.title).to eq(excursion_params[:title])
  end

  describe 'sad paths' do
    it 'will return an error if ID is not found' do
      user = User.create(id: 1)

      excursion_params = {title: "Excursion303"}
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/users/#{user.id}/excursions/1", headers: headers, params: JSON.generate(excursion_params)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
    end
  end
end

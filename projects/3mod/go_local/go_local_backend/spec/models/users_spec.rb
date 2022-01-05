# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :id }
  end

  describe 'relationships' do
    it { should have_many :favorites }
    it { should have_many :excursions }
  end

  describe 'instantiation' do
    it 'exists with attributes' do
      user1 = create(:user, id: 1)

      expect(user1).to be_instance_of User
    end
  end

  describe 'favorite excursions' do
    it 'gets the user\'s favorited excursions' do
      user = create(:user)
      favorites = create_list(:excursion, 2)
      favorites.each do |excursion|
        create(:favorite, user: user, excursion: excursion)
      end
      not_favorite = create(:excursion)

      expect(user.saved_excursions).to match_array(favorites)
    end
  end
end

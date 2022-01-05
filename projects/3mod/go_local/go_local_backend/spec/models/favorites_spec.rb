# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :excursion }
  end

  describe 'instantiation' do
    it 'exists with attributes' do
      user1 = create(:user, id: 1)
      ex1 = create(:excursion, author_id: user1.id)
      favorite = create(:favorite, user: user1, excursion: ex1)

      expect(favorite).to be_instance_of Favorite
    end
  end
end

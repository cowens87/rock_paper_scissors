require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe 'relationships' do
    it { should have_many :friends }
    it { should have_many(:followings).through(:friends) }
    it { should have_many(:parties_users) }
    it { should have_many(:parties).through(:parties_users) }
  end

  describe 'instance methods' do
    before :each do
      @user = User.create!(email: 'test5@gmail.com', password: 'test5test5')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @user.authenticate(@user.password)
      @friend = User.create!(email: 'friend1@email.com', password: 'password')

      @movie_1 = Movie.create!(title: 'Mulan', run_time: '1 hour 12 min')
      @movie_2 = Movie.create!(title: 'Oceans 11', run_time: '2 hours 10 min')
      @party_1 = @movie_1.parties.create!(start_time: '3:00 PM', date: '20/12/12', duration: 112)
      @party_2 = @movie_2.parties.create!(start_time: '5:00 PM', date: '12/12/12', duration: 156)

      PartiesUser.create!(party_id: @party_1.id, user_id: @user.id, host: true)
      PartiesUser.create!(party_id: @party_2.id, user_id: @user.id, host: false)
    end

    it 'hosted_parties' do
      expect(@user.hosted_parties).to eq([@party_1])
    end

    it 'invited_parties' do
      expect(@user.invited_parties).to eq([@party_2])
    end

    it 'has no followers' do
      expect(@user.no_followers?).to eq(true)
    end
  end
end

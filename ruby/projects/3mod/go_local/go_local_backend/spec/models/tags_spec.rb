# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :taggings }
  end

  describe 'instantiation' do
    it 'exists with attributes' do
      tag1 = create :tag

      expect(tag1).to be_instance_of Tag
    end
  end
end

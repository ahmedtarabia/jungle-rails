require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      described_class.new(
        email: 'test@test.com',
        first_name: 'Ahmed',
        last_name: 'Tarabia',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid with unmatching password and password_confirmation' do
      subject.password_confirmation = 'some_other_password'
      expect(subject).to_not be_valid
    end

    it 'is invalid when password or password_confirmation is not provided' do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when first_name is not provided' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when last_name is not provided' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when email is not provided' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid when email is already taken' do
      @user1 =
        User.new(
          first_name: 'Ahmed',
          last_name: 'Tarabia',
          email: 'ahmed@tarabia.com',
          password: 'password',
          password_confirmation: 'password'
        )
      @user1.save!

      new_user2 =
        User.new(
          email: 'ahmed@tarabia.com',
          first_name: 'Ahmed',
          last_name: 'Tarabia',
          password: 'password',
          password_confirmation: 'password'
        )
      expect(new_user2).to_not be_valid
    end

    it 'is invalid when password is less than 8 characters' do
      subject.password = 'invalid'
      subject.password_confirmation = 'invalid'
      expect(subject).to_not be_valid
    end
  end
end
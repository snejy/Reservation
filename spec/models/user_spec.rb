require 'spec_helper'

module Reservation

  describe User do
    it 'should create users' do
      expect { User.create(:username => "Snejana",
                           :password => '123456')}.to_not raise_error
    end

    it 'should update user\'s username' do
        user = User.all.last(:username => "Snejana")
        user.update(:username => "Someuser")
        expect(User.count(:username => "Snejana").to_s).to eq("0")
    end

    it 'should update user\'s password' do
        user = User.all.last(:username => "Someuser")
        user.update(:password => "parola")
        expect(User.count(:password => '123456').to_s).to eq("0")
    end

    it 'should not create user with shorter username than 6 characters' do
        User.create(:username=> 'user',:password => "password")
        expect(User.count().to_s).to eq("1")
    end

    it 'should not create user with the same username' do
        User.create(:username=> 'Someuser',:password => "password")
        expect(User.count().to_s).to eq("1")
    end

    it 'should not create user without username' do
        user = User.new
        user.save
        expect(User.count().to_s).to eq("1")
    end

    it 'should not create user without password' do
        user = User.new(:username => "Someusername")
        user.save
        expect(User.count().to_s).to eq("1")
    end
  end
end
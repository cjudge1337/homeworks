require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  it "compares stored password with input password" do
    user = User.create!(username: "c", password: "123456")
    expect(user.valid_password?("123456")).to eq(true)
  end

  it "resets a session token" do
    user = User.create!(username: "c", password: "123456")
    session_token = user.session_token
    user.reset_session_token!
    expect(user.session_token).not_to eq(session_token)
  end

  it "can look for a user by their credentials" do
    user = User.create!(username: "c", password: "123456")
    expect(User.find_by_credentials("c", "123456")).to eq(user)
  end

end

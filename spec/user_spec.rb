require 'rails_helper'

RSpec.describe User, type: :model do
  it 'requires password to include at least one uppercase letter and one digit' do
    user = User.new(password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include('Your password must include at least one uppercase letter and one digit')

    user.password = 'Password1'
    expect(user).to be_valid
  end
end
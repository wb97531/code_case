require 'rails_helper'

RSpec.describe Coder, type: :model do
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:coder_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:coder_name) }
  it { should validate_length_of(:password) }
  it { should have_db_column(:verified_email).with_options(null: true) }
  it { should have_db_column(:token).with_options(null: true) }
end

describe 'needs_verification!' do
  let(:coder) { FactoryGirl.create(:coder, token: '', verified_email: true) }

  it 'sets the verified email address field as false' do
    expect { coder.needs_verification! }.to change(
      coder, :verified_email?).from(true).to(false)
  end

  it 'sets the token for the coder' do
    expect { coder.needs_verification! }.to change(coder, :token)
  end

  it 'sends a verification email' do
    expect { coder.needs_verification! }.to change(
      ActionMailer::Base.deliveries, :count).by(1)
  end
end

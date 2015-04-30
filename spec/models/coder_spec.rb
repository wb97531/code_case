require 'rails_helper'

RSpec.describe Coder, type: :model do
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:coder_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:coder_name) }
  it { should validate_length_of(:password) }
end

require 'rails_helper'

describe User do
  it { should have_many :bookings }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :name }
  it { should validate_presence_of :matrix_no }
end

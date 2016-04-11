require 'rails_helper'

describe Lecturer do
  it { should have_many :bookings }
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
end

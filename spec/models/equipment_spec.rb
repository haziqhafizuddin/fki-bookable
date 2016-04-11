require 'rails_helper'

describe Equipment do
  it { should have_many :bookings }
  it { should validate_presence_of :name }
end

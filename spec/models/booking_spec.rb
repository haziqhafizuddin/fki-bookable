require 'rails_helper'

describe Booking do
  it { should belong_to :equipment }
  it { should belong_to :user }
  it { should belong_to :lecturer }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :equipment_id }
end

require 'rails_helper'

describe Movie do
  it { should validate_presence_of :title }
  it { should have_many :reviews }
end

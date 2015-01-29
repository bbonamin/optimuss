require 'spec_helper'

describe 'Optimus CLI' do
  it 'runs and exits with a status 0' do
    expect(system 'bundle exec bin/optimuss prime_table').to eq(true)
  end
end
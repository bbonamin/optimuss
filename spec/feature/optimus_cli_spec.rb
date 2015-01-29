require 'spec_helper'

describe 'Optimus CLI' do
  it 'runs and exits with a status 0' do
    expect(system 'bundle exec bin/optimuss prime_table').to eq(true)
  end

  it 'prints a multiplication table with the first 10 prime numbers' do
    output = `bundle exec bin/optimuss prime_table`
    table = primes_from_stdlib_multiplication_table
    expect(table).to_not be_empty
  end
end


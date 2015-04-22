require 'rspec/expectations'

RSpec::Matchers.define :report do |expected|
  match do |actual|
    actual.report == expected
  end
end

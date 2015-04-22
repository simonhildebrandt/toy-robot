require 'rspec/expectations'

RSpec::Matchers.define :report do |expected|
  match do |actual|
    actual.report == expected
  end
  failure_message do |actual|
    "expected that #{actual} would report #{actual.report} instead of #{expected}"
  end
end

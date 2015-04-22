require 'spec_helper'
require_relative '../runner'

describe Runner do
  context "produces the correct result for the first example" do
    subject { described_class.new(example_path('first')) }

    it { is_expected.to report("0,1,NORTH") }
  end
end

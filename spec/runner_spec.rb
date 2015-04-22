require 'spec_helper'
require_relative '../runner'

describe Runner do
  def example_path(name)
    File.expand_path('../examples/' + name + '.txt', __FILE__)
  end

  context "produces the correct result for the first example" do
    subject { described_class.new(example_path('first')) }
    it { is_expected.to report("0,1,NORTH") }
  end

  context "produces the correct result for the second example" do
    subject { described_class.new(example_path('second')) }
    it { is_expected.to report("0,0,WEST") }
  end

  context "produces the correct result for the third example" do
    subject { described_class.new(example_path('third')) }
    it { is_expected.to report("3,3,NORTH") }
  end

  context "produces the correct result for the fourth example" do
    subject { described_class.new(example_path('fourth')) }
    it { is_expected.to report("2,2,EAST\n3,3,NORTH") }
  end
end

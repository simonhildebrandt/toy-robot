require 'spec_helper'
require_relative '../field'

describe Field do
  context "ignores commands before the robot is placed" do
    it { subject.move; is_expected.to report(nil) }
    it { subject.turn; is_expected.to report(nil) }
  end

  context "understands placing the robot" do
    it { subject.place(0, 0, 'NORTH'); is_expected.to report([0, 0, 'NORTH']) }
  end
end

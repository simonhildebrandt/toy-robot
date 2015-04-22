require 'spec_helper'
require_relative '../field'

describe Field do
  context "ignores commands before the robot is placed" do
    it { subject.move; is_expected.to report(nil) }
    it { subject.turn; is_expected.to report(nil) }
  end

  context "understands placing the robot" do
    it { subject.place(0, 0, 'NORTH'); is_expected.to report([0, 0, 'NORTH']) }
    it { subject.place(4, 4, 'SOUTH'); is_expected.to report([4, 4, 'SOUTH']) }
    it { subject.place(5, 4, 'EAST'); is_expected.to report(nil) }
    it "and doesn't lose information on an invalid instruction" do
      subject.place(4, 4, 'SOUTH')
      subject.place(5, 5, 'NORTH')
      is_expected.to report([4, 4, 'SOUTH'])
    end
  end

  context "understands moving the robot" do
    before do
      subject.place(3, 3, 'NORTH')
    end
    it { subject.move; is_expected.to report([3, 4, 'NORTH']) }
    it "doesn't move off the table" do
      subject.move
      subject.move
      is_expected.to report([3, 4, 'NORTH'])
    end
  end
end

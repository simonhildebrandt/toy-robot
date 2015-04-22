require 'spec_helper'
require_relative '../field'

describe Field do
  context "ignores commands before the robot is placed" do
    it { subject.move; is_expected.to report(nil) }
    it { subject.turn(:left); is_expected.to report(nil) }
  end

  context "understands placing the robot" do
    it { subject.place(0, 0, 'NORTH'); is_expected.to report([0, 0, 'NORTH']) }
    it { subject.place(4, 4, 'SOUTH'); is_expected.to report([4, 4, 'SOUTH']) }
    it "and understands the limits of the board" do
      subject.place(5, 4, 'EAST'); is_expected.to report(nil)
    end
    it "and understands the limits of the board" do
      subject.place(0, -1, 'WEST'); is_expected.to report(nil)
    end
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
    it "and doesn't move it off the table" do
      subject.move
      subject.move
      is_expected.to report([3, 4, 'NORTH'])
    end
  end

  context "understands turning the robot" do
    before do
      subject.place(3, 3, 'NORTH')
    end

    it { subject.turn(:left); is_expected.to report([3, 3, 'WEST']) }
    it { subject.turn(:right); is_expected.to report([3, 3, 'EAST']) }
  end
end

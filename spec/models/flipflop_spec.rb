require 'spec_helper'

RSpec.describe Flipflop do
  describe "assign_admin_set?" do
    subject { described_class.assign_admin_set? }
    it { is_expected.to be true }
  end
end

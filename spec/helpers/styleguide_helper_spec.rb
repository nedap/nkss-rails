require 'spec_helper'

describe StyleguideHelper, type: :helper do
  before(:all) do
    @block = proc do
      kss_block('2.1') do
        # not this line
        # not this one either
      end

      kss_block('2.2') do
        # first line of the block

        # empty line should be included
        # last line of the block
      end # kss_block end
    end # proc block end
  end

  before do
    helper.lookup_context.view_paths << 'app/views'
  end

  # NOTE tested in acceptance
  # describe "#kss_block" do
  # end

  describe "#kss_specimen" do
    subject { helper.kss_specimen }

    it { should include 'class=\'sg-specimen\'' }
  end

  describe "#kss_swatch" do
    subject { kss_swatch('a name', 'pink', options) }

    context "not specifying any options" do
      subject { kss_swatch('a name', 'pink') }

      it { should include 'color: pink' }
      it { should include 'class=\'sg-swatch \'' }
    end

    context "specifying dark background" do
      let(:options) { {:dark => true} }

      it { should include 'class=\'sg-swatch sg-dark\'' }
    end
  end

  describe "#lorem" do
    subject { helper.lorem }

    it { should == FFaker::Lorem }
  end

  describe "#markdown" do
    subject { helper.markdown("**Strong** _emphases_") }

    it { should == "<p><strong>Strong</strong> <em>emphases</em></p>" }
  end

  # protected

  describe "#capture_source" do
    subject { helper.capture_source(section_id, @block) }

    context "when section is not found in the block" do
      let(:section_id) { '1.1' }

      specify { expect { subject }.to raise_error(IndexError) }
    end

    context "when section is found in the block" do
      let(:section_id) { '2.2' }

      it('matches the four lines defined at the top of this file') do
        should ==
          "      # first line of the block\n"\
          "\n"\
          "      # empty line should be included\n"\
          "      # last line of the block"
      end
    end
  end

  describe "#source_language" do
    subject { helper.source_language(block) }

    context "when block file ends with erb" do
      let(:block) { double(:block, :source_location => ['a.html.erb', 1]) }

      it { should == 'erb' }
    end

    context "when block file ends with haml" do
      let(:block) { double(:block, :source_location => ['a.html.haml', 1]) }

      it { should == 'haml' }
    end
  end

end

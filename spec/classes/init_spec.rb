require 'spec_helper'
describe 'lnet' do

  context 'with defaults for all parameters' do
    it { should contain_class('lnet') }
  end
end

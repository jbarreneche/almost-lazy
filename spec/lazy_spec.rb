require 'lib/almost-lazy'

describe 'Lazyness' do
  it 'should be available to world wide' do
    lambda {
      lazy { nil }
    }.should_not raise_error NameError
  end
  it 'should delegate to blocks result' do
    evaluated = mock('my_mock')
    some_lazy = lazy { evaluated.eval! }
    evaluated.should_receive(:eval!).once.and_return(evaluated)
    evaluated.should_receive(:non_standard_method).and_return("Received!")
    some_lazy.non_standard_method.should == "Received!"
    some_lazy.should ==(evaluated)
    some_lazy.should be(evaluated)
  end
  it 'should delegate to blocks result' do
    evaluated = mock('my_mock')
    some_lazy = lazy { evaluated.eval! }
    evaluated.should_receive(:eval!).once.and_return(evaluated)
    evaluated.should_receive(:non_standard_method).and_return("Received!")
    some_lazy.non_standard_method.should == "Received!"
    some_lazy.should ==(evaluated)
    some_lazy.should be(evaluated)
  end
end


require './lib/fizz_buzz'

RSpec.describe FizzBuzz do 

    it 'returns a number if no game rules are met' do 
        expect(subject.check(1)).to eq 1
    end

end
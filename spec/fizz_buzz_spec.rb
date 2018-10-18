require './lib/fizz_buzz'

RSpec.describe FizzBuzz do 

    it 'returns a number if no game rules are met' do 
        expect(subject.check(1)).to eq 1
    end

    it 'returns fizz if number is divisible by 3' do 
        expect(subject.check(3)).to eq 'fizz'
    end

    it 'returns buzz if number is divisible by 5' do 
        expect(subject.check(5)).to eq 'buzz'
    end

    it 'returns fizzbuzz if number is divisible by 15' do 
        expect(subject.check(15)).to eq 'fizzbuzz'
    end

end
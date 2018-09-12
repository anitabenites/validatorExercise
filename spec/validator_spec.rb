require './lib/validator'

RSpec.describe(Validator) do
  subject { Validator.new } #subject = object

  describe '#validate_word' do
    context 'when a word contains only alphabetical characters' do
      let(:word) { 'this' }

      it 'returns true' do
        expect(subject.validate_word?(word)).to eq(true)
      end
    end

    context 'when a word contains only alphabetical characters and ends with a comma' do
      let(:word) { 'this,' }

      it 'returns true' do
        expect(subject.validate_word?(word)).to eq(true)
      end
    end

    context 'when a word contains only alphabetical characters and contains one or more uppercases' do
      let(:word) { 'tHIs,' }

      it 'returns true' do
        expect(subject.validate_word?(word)).to eq(true)
      end
    end

    context 'when a word contains not only alphabetical characters' do
      # let(:word_numbers) { '1212this1212' }
      # let(:word_special) { 'this!!!!!' }

      invalid_words = ['1212this1212', 'this!!!!!']

      invalid_words.each do |word|
        it 'returns false' do
          expect(subject.validate_word?(word)).to eq(false)
        end
      end

    end
  end

  describe '#validate_sentence' do
    context 'when the words are separated with spaces.' do
      let(:sentence) { 'hello word.' }

      it 'returns true' do
        expect(subject.validate_sentence?(sentence)).to eq(true)
      end
    end

    context 'when the sentence ends with an exclamation mark' do
      let(:sentence) { 'hello world, my first programming!' }

      it 'returns true' do
        expect(subject.validate_sentence?(sentence)).to eq(true)
      end
    end

    context 'when the sentence ends with a question mark' do
      let(:sentence) { 'hello world, my first programming?' }

      it 'returns true' do
        expect(subject.validate_sentence?(sentence)).to eq(true)
      end
    end

    context 'when the sentence ends with a period' do
      let(:sentence) { 'hello world, my first programming.' }

      it 'returns true' do
        expect(subject.validate_sentence?(sentence)).to eq(true)
      end
    end

    context 'when the sentence ends with an incorrect punctuation' do
      let(:sentence) {'hello world, my first programming'}

      it 'returns false' do
        expect(subject.validate_sentence?(sentence)).to eq(false)
      end
    end

    context 'when the sentence contains numbers' do
      let(:sentence) {'hello world, my first programming numbers uiu 1!'}

      it 'returns false' do
        expect(subject.validate_sentence?(sentence)).to eq(false)
      end
    end

    context 'when the sentence contains special characters' do
      let(:sentence) {'hello world, my first programming has numbers $.'}

      it 'returns false' do
        expect(subject.validate_sentence?(sentence)).to eq(false)
      end
    end

    context 'when the sentence contains invalid words'do
      let(:sentence) {'hello world, my first programming t18764@ words.'}

      it 'returns false' do
        expect(subject.validate_sentence?(sentence)).to eq(false)
      end
    end
 end
end

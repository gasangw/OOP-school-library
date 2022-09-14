require_relative 'spec-helper'

describe Decorator do
  before :each do
    @person = Person.new(38, 'abbynyakaramogusu')
  end

  context 'CapitalizeDecorator' do
    it 'capitalize first letter of name' do
      capitalize = CapitalizeDecorator.new(@person)
      expect(capitalize.correct_name).to eql('Abbynyakaramogusu')
    end
  end
  context 'TrimmerDecorator' do
    it 'trims name to 10 characters' do
      trim = TrimmerDecorator.new(@person)
      expect(trim.correct_name).to eql('abbynyakar')
      expect(trim.correct_name.length).to be <= 10
    end
  end
end

require 'rails_helper'

RSpec.describe Todo, type: :model do
  it 'has a valid factory' do
    expect(create(:todo)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:title)) }

  describe 'Todo.total_items' do
    it 'should be 0 if there are no todos' do
      expect(Todo.total_items).to be_zero
    end

    it 'should return the total number of todos' do
      create_list(:todo, 3)
      expect(Todo.total_items).to eq 3
    end
  end

  describe 'Todo.completed_items' do
    it 'should return the count of completed items' do
      create_list(:todo, 3)
      create_list(:todo, 2, completed: true)
      expect(Todo.completed_items).to eq 2
    end
  end

  describe 'Todo.percent_completed' do
    it 'should give the percentage of completed items' do
      create_list(:todo, 3)
      create_list(:todo, 1, completed: true)
      expect(Todo.percent_completed).to eq 25
    end

    it 'should return 0 if there are no todos' do
      expect(Todo.percent_completed).to be_zero
    end
  end
end

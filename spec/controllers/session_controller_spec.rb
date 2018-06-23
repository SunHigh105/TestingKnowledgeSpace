require 'rails_helper'
describe Session do
    subject{}
    context '正しいデータで投稿できること' do
        before do
          subject.save
        end
        it { should be_valid }
        it { expect(subject.errors.size).to eq 0 }
    end
end
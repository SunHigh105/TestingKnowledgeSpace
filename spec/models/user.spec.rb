require 'rails_helper'
# バリデーション
# 空欄
describe User do
  context '何も入力しなかった場合' do
    subject { User.create }
    it { should_not be_valid}
    it { expect(subject.errors[:name].size).to eq 1 }
    it { expect(subject.errors[:email].size).to eq 2 }
  end
end

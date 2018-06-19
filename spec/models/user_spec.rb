require 'rails_helper'
# バリデーション
# 空欄
describe User do
  # context '何も入力しなかった場合エラーが4つ出る' do
  #   subject { User.create }
  #   it { should_not be_valid }
  #   it { expect(subject.errors.size).to eq 4 }
  # end
  subject { User.new(
    name: "Tarou Yamada",
    email: "tarou@test.com",
    password: "tarou123", 
    password_confirmation: "tarou123"
  ) }

  context '正しいデータで登録できること' do
    before do
      subject.save
    end
    it { should be_valid }
    it { expect(subject.errors.size).to eq 0 }
  end

  context '名前が空欄のときエラーになること' do
    before do
      subject.name = ""
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.size).to eq 1 }
  end

  context '名前が50文字を超えるとエラーになること' do
    before do
      subject.name = "T" * 51
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.size).to eq 1 }
  end
end

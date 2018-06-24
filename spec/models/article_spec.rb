require 'rails_helper'
describe Article do
    # user = User.create!(
    #     name: "ユニットテスト",
    #     email: "unit@test.com",
    #     password: "unittest",
    #     password_confirmation: "unittest"
    # )
    user = User.find_by(email: "unit@test.com")
    subject { Article.new(
    user_id: user.id,
    title: "記事投稿ユニットテスト",
    content: "この記事はユニットテスト用に投稿した記事です。"
  ) }

  context '正しいデータで投稿できること' do
    before do
      subject.save
    end
    it { should be_valid }
    it { expect(subject.errors.size).to eq 0 }
  end

  context 'タイトルが空欄のときエラーになること' do
    before do
      subject.title = ""
      subject.save
    end
    it { should be_invalid }
    it { expect(subject.errors.full_messages[0]).to eq "タイトルを入力してください" }
  end

  context 'タイトルが50文字を超えるとエラーになること' do
    before do
      subject.title = "あ" * 51
      subject.save
    end
    it { should be_invalid }
    it { expect(subject.errors.full_messages[0]).to eq "タイトルは50文字以内で入力してください" }
  end

  context '本文が空欄のときエラーになること' do
    before do
      subject.title = "あ" * 50
      subject.content = ""
      subject.save
    end
    it { should be_invalid }
    it { expect(subject.errors.full_messages[0]).to eq "本文を入力してください" }
  end

  context '本文が1000文字を超えるとエラーになること' do
    before do
      subject.content = "あ" * 1001
      subject.save
    end
    it { should be_invalid }
    it { expect(subject.errors.full_messages[0]).to eq "本文は1000文字以内で入力してください" }
  end

end
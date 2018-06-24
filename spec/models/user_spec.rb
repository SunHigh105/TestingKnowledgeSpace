require 'rails_helper'
describe User do
  subject { User.new(
    name: "Tarou Yamada",
    email: "tarou@test.com",
    password: "tarou123", 
    password_confirmation: "tarou123"
  ) }

  context '名前が空欄のときエラーになること' do
    before do
      subject.name = ""
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "名前を入力してください" }
  end

  context '名前が50文字を超えるとエラーになること' do
    before do
      subject.name = "T" * 51
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "名前は50文字以内で入力してください" }
  end

  context 'メールアドレスが空欄のときエラーになること' do
    before do
      subject.name = "T" * 50
      subject.email = ""
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "メールアドレスを入力してください" }
  end

  context 'メールアドレスが255文字を超えるとエラーになること' do
    before do
      subject.email = "t" * 256
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "メールアドレスは255文字以内で入力してください" }
  end

  context 'メールアドレスの形式が不正なときエラーになること' do
    before do
      subject.email = "testtest.com"
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "メールアドレスが不正です" }
  end

  context 'メールアドレスに半角英数記号以外を含むときエラーになること' do
    before do
      subject.email = "テスト@test.com"
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "メールアドレスが不正です" }
  end

  context '登録ずみのメールアドレスはエラーになること' do
    before do
      User.create!(
        name: "Jirou Yamada",
        email: "jirou@test.com",
        password: "jirou123", 
        password_confirmation: "jirou123"
      )
      subject.email = "jirou@test.com"
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "メールアドレスはすでに存在します" }
  end

  context 'パスワードが空欄の時エラーになること' do
    before do
      subject.password = ""
      subject.password_confirmation = ""
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "パスワードを入力してください" }
  end

  context 'パスワードが6文字より少ないとエラーになること' do
    before do
      subject.password = "tarou"
      subject.password_confirmation = "tarou"
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "パスワードは6文字以上で入力してください" }
  end

  context 'パスワードが一致していないとエラーになること' do
    before do
      subject.password = "tarou123"
      subject.password_confirmation = "tarou234"
      subject.save
    end
    it { should_not be_valid }
    it { expect(subject.errors.full_messages[0]).to eq "パスワード（確認）とパスワードの入力が一致しません" }
  end

  context '正しいデータで登録できること' do
    before do
      subject.save
    end
    it { should be_valid }
    it { expect(subject.errors.size).to eq 0 }
  end
end

require 'rails_helper'

describe Diary do
  describe '#create' do
    it "is valid with a text, date, point" do
      diary = build(:diary)
      expect(diary).to be_valid
    end

    it "is invalid without a text" do
      diary = build(:diary, text: nil)
      diary.valid?
      expect(diary.errors[:text]).to include("を入力してください")
    end

    it "is invalid without a date" do
      diary = build(:diary, date: nil)
      diary.valid?
      expect(diary.errors[:date]).to include("を入力してください")
    end

    it "is invalid without a point" do
      diary = build(:diary, point: nil)
      diary.valid?
      expect(diary.errors[:point]).to include("を入力してください")
    end

    it "is invalid with a duplicate date abd user_id 1" do
      diary = create(:diary)
      another_diary = build(:diary, text: "aaa", date: diary.date, point: 1, user_id: diary.user_id)
      another_diary.valid?
      expect(another_diary.errors[:date]).to include("はすでに存在します")
    end

  end
end
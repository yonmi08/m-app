require 'rails_helper'

describe Group do
  describe '#create' do
    it "is valid with a name, border, genre" do
      group = build(:group)
      expect(group).to be_valid
    end

    it "is invalid without a name" do
      group = build(:group, name: nil)
      group.valid?
      expect(group.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a border" do
      group = build(:group, border: nil)
      group.valid?
      expect(group.errors[:border]).to include("を入力してください")
    end

    it "is invalid without a genre" do
      group = build(:group, genre: nil)
      group.valid?
      expect(group.errors[:genre]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 13 characters " do
      group = build(:group, name: "aaaaabbbbbccc")
      group.valid?
      expect(group.errors[:name]).to include("は12文字以内で入力してください")
    end

    it "is valid with a name that has less than 12 characters " do
      group = build(:group, name: "aaaaaa")
      expect(group).to be_valid
    end
  end
end
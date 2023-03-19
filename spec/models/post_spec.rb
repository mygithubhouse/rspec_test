require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    describe 'it validates name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe 'it validates title' do
      it { is_expected.to validate_presence_of(:title) }
    end

      it "should have many comments" do
        t = Post.reflect_on_association(:comments)
        expect(t.macro).to eq(:has_many)
      end

      it "should have one post" do
        t = Comment.reflect_on_association(:post)
        expect(t.macro).to eq(:belongs_to)
      end
  end
end

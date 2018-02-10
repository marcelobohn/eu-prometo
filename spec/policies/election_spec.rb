describe ElectionPolicy do
  subject { described_class }

  permissions :update?, :edit?, :new? do
    it "denies access if post is published" do
      expect(subject).not_to permit(User.new(admin: true), Election.new(year: 2014, type_election: 0))
    end

#     it "grants access if post is published and user is an admin" do
#       expect(subject).to permit(User.new(admin: true), Election.new(year: 2014, type_election: 0))
#     end

#     it "grants access if post is unpublished" do
#       expect(subject).to permit(User.new(admin: false), Post.new(published: false))
#     end
  end
end
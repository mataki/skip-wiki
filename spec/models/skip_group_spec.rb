require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SkipGroup do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :display_name => "value for display_name",
      :gid => "value for gid"
    }
  end

  it "should create a new instance given valid attributes" do
    SkipGroup.create!(@valid_attributes)
  end

  describe ".new( <empty> )" do
    before do
      @group = SkipGroup.new
      @group.valid? #=> false
    end

    it "should have errors on :name" do
      @group.should have(1).errors_on(:name)
    end
  end

  describe "#grant(identity_urls)" do
    subject{ SkipGroup.create!(@valid_attributes) }
    before do
      @alice = create_user(:name => "alice")
      @bob = create_user(:name => "bob")

      subject.grant([@alice.identity_url, @bob.identity_url])
      subject.save!
    end

    it{ subject.group.users.should == [@alice, @bob] }

    context "更新する場合" do
      before do
        @charls = create_user(:name => "charls")

        subject.grant([@alice.identity_url, @charls.identity_url])
      end

      it{ subject.group.users.should == [@alice, @charls]}
    end
  end

  describe ".sync" do
    def identity_url_gen(*ids)
      ids.map{|x| "http://op.example.com/user/user-#{x}" }
    end
    before do
      ("a".."l").each{|i|
        User.create!(:name=>"user-#{i}", :display_name=>"User.#{i}"){|u| u.identity_url="http://op.example.com/user/user-#{i}"}
      }
      SkipGroup.sync!([
        {:gid => "12345", :name => "name1", :display_name => "SKIP Group.1", :members => identity_url_gen(*%w[a b c])},
        {:gid => "12346", :name => "name2", :display_name => "SKIP Group.2", :members => identity_url_gen(*%w[c d e])},
        {:gid => "12347", :name => "name3", :display_name => "SKIP Group.3", :members => identity_url_gen(*%w[e f g])},
        {:gid => "12348", :name => "name4", :display_name => "SKIP Group.4", :members => identity_url_gen(*%w[g h i])},
      ])
    end
    it{ SkipGroup.should have(4).records }

    describe "created SkipGroup" do
      subject{ SkipGroup.first }
      it{ subject.group.should have(3).users }
    end

    describe "洗いがえをした場合" do
      before do
        SkipGroup.sync!([
          {:gid => "12345", :name => "name1", :display_name => "SKIP-Group.1", :members => identity_url_gen(*%w[a b c])},
          {:gid => "12346", :name => "name2", :display_name => "SKIP-Group.2", :members => identity_url_gen(*%w[c d e f])},
          {:gid => "22347", :name => "name23", :display_name => "SKIP-Group.23", :members => identity_url_gen(*%w[e f g])},
          {:gid => "22348", :name => "name24", :display_name => "SKIP-Group.24", :members => identity_url_gen(*%w[a b c])},
          {:gid => "22349", :name => "name25", :display_name => "SKIP-Group.25", :members => identity_url_gen(*%w[a b c])},
        ])
      end

      it "5つのグループがあること" do
        SkipGroup.should have(5).records
      end

      it "name3とname4のグループは消えていること" do
        SkipGroup.find_all_by_name(%w[name3 name4]).should be_blank
      end

      it "name2のグループにfさんが入っていること" do
        sg = SkipGroup.find_by_name("name2")
        sg.group.users.find_by_name("user-f").should_not be_blank
      end

      it "hさんとiさんはどのグループにも属していないこと" do
        h,i = User.find_all_by_name(%w[user-h user-i])
        h.should have(0).groups
        i.should have(0).groups
      end

      it "グループの各属性(name)が更新されていること" do
        SkipGroup.all.should be_all{|g| g.name =~ /\Aname\d+\Z/ }
      end

      describe "100件のベンチマーク" do
        subject do
          (1..(100+5)).each{|i|
            User.create!(:name=>"user-#{i}", :display_name=>"User.#{i}"){|u| u.identity_url="http://op.example.com/user/user-#{i}"}
          }

          data = (1..100).map do |i|
            members = (i..(i+5)).map{|j| "http://op.example.com/user/user-#{j}" }
            {:gid => 1000 + i, :name => "name%04d" % i, :display_name => "SKIP-Group-#{i}", :members => members}
          end
          lambda{ SkipGroup.sync!(data) }
        end

        it{ should be_completed_within 5.second }
      end
    end
  end
end

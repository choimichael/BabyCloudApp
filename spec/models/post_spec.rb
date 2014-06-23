require 'spec_helper'

describe Post do
  it { should belong_to(:user) }
  it { should have_db_column(:user_id) }
  it { should have_db_column(:title) }
  it { should have_db_column(:description) }
  it { should have_db_column(:latitude) }
  it { should have_db_column(:longitude) }
  it { should have_db_column(:date) }
  it { should have_attached_file(:image) }
end

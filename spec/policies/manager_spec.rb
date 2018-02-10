require 'rails_helper'

RSpec.describe ManagerPolicy do
  it "should raise an exception when users aren't logged in" do
    expect { ManagerPolicy.new(nil, nil) }.to  raise_error(Pundit::NotAuthorizedError)
  end
end
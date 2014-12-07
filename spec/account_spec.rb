require 'spec_helper'

describe Account do
 
  before :each do
    @account = Account.new '1.1.1.1', 'Caixa'
  end

  describe "#new"  do
    it "returns a new account object" do
      expect(@account).to be_an_instance_of(Account)
    end
    it "throws an argument error when given wrong number of parameters" do
      expect { Account.new "1.1.1.1" }.to raise_exception ArgumentError
    end
  end

  describe "#code"  do
    it "returns the correct code" do
      expect(@account.code).to eql "1.1.1.1"
    end
  end
  describe "#name"  do
    it "returns the correct name" do
      expect(@account.name).to eql "Caixa"
    end
  end
  describe "#type" do
    it "returns the correct type" do
      expect(@account.type).to eql "Ativo"
    end 
  end
  describe "#level" do
    it "returns the correct level" do
      expect(@account.level).to eql 0
    end 
  end
  describe "#higher_account_code" do
    it "returns the account code one level higher" do
      expect(@account.higher_account_code).to eql "1.1.1"
    end 
  end

end

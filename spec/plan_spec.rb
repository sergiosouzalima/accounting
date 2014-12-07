require 'spec_helper'
require 'brdinheiro'

describe Plan do
 
  before :each do
    @plan = Plan.new
    @plan.add_account Account.new('1.1.1.1','Caixa',6000.00,0) 
    @plan.add_account Account.new('1.1.1.2','Banco',6000.00,0) 
    @plan.add_account Account.new('1.1.1','Circulante') 
    @plan.add_account Account.new('1.1','Disponiveis') 
  end

  describe "new accounts"  do
    
    it "accepts new accounts" do
      @plan.add_account( Account.new('1.1.1.1','Caixa') )
      expect(@plan.get_account('1.1.1.1')).to be_an_instance_of(Account)
    end
  end

  describe "get accounts" do

    it "by code, returns name account" do
      @plan.add_account( Account.new('1.1.1.2','Banco') )
      expect(@plan.get_account('1.1.1.2').name).to eql 'Banco'
    end

    it "by code, returns level account" do
      @plan.add_account( Account.new('1.1.1.2','Banco') )
      expect(@plan.get_account('1.1.1.2').level).to eql 0
    end

    it "returns all accounts" do
      expect(@plan.get_accounts.size).to eq(4)
    end

  end

end

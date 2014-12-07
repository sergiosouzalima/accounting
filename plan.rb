require 'brdinheiro'

class Plan
  attr_accessor :accounts

  def initialize
    @accounts = []
  end

  def add_account account
    @accounts.push account
  end

  def get_account code
    @accounts.select { |a| a.code == code }.first
  end

  def get_accounts
    @accounts.sort_by { |e| e.code }
  end

  def get_balance_sheet
    puts "CODIGOS".ljust(7) + " " + 
      "CONTAS".ljust(30) + " " + 
      "SALDO ANT".rjust(15) + " " + 
      "DEBITO".rjust(15) + " " + 
      "CREDITO".rjust(15) + " " + 
      "SLD ATUAL".rjust(15)
    get_accounts.select do |e|
      name = e.name[0,28]
      puts "#{e.code.ljust(7)+' '+
        name.ljust(30).gsub(' ','.') +' '+ 
        frmt_curr( e.opening_balance ) +' '+ 
        frmt_curr( e.debit ) + ' '+ 
        frmt_curr( e.credit ) + ' ' +
        frmt_curr( e.current_balance ) }" 
    end
  end

  def summarize
    set_zero_to_accounts
    @accounts.sort_by{ |e| e.level }.select{ |e| e.level <= 2 }.select do |a|
        if a.level == 0
        # update current account
        if a.type == 'Ativo'
          a.current_balance += a.opening_balance + a.debit.to_i - a.credit.to_i
        else
          a.current_balance += a.opening_balance + a.credit.to_i - a.debit.to_i
        end
      end
      # update higher accounts
      hc = get_account(a.higher_account_code) 
      hc.opening_balance += a.opening_balance
      hc.debit += a.debit.to_i
      hc.credit += a.credit.to_i
      hc.current_balance += a.current_balance.to_i
    end
  end

private
  def set_zero_to_accounts
    @accounts.select{ |e| e.level >= 1 }.select do |a|
      a.current_balance = a.opening_balance = a.debit = a.credit = 0
    end
  end

  def frmt_curr(val = 0, spaces_to_right = 15)
    ret = val.real_contabil.rjust(spaces_to_right)
  end  
end


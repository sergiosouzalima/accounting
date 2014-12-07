class Account
  attr_accessor :code, :name, :debit, :credit, :current_balance, :opening_balance    
  attr_reader :type, :level, :higher_account_code
  
  def initialize(code, name, opening_balance = 0.00, debit = 0.00, credit = 0.00)
    @code = code
    @name = name
    @type = get_account_type( code )
    @level = get_account_level( code )
    @higher_account_code = get_higher_account_code( code )
    @opening_balance = opening_balance
    @debit = debit
    @credit = credit
    @current_balance = 0.00
  end

private
  def get_account_type( code )
    code[0] == '1' ? "Ativo" : "Passivo"
  end

  def get_account_level( code )
    case code.count(".")
      when 3
        0 # analytic account (eg. Caixa)
      when 2
        1 # synthetic account
      when 1
        2 # synthetic account
      when 0
        3 # synthetic account (eg. Ativo, Passivo)
      else
        -1
    end
  end

  def get_higher_account_code( code )
    code.length > 1 ? code[ 0, code.rindex(".") ] : '0'
  end

end

$ irb
> load "account.rb" ; load "plan.rb"
> p = Plan.new
> p.add_account( Account.new('1.1.1.1','Caixa',100000,1400000,603450) )
> p.add_account( Account.new('1.1.1','Disponibilidades') )
> p.add_account( Account.new('1.1','Ativo Circulante') )
> p.add_account( Account.new('1','Ativo') )
> p.add_account( Account.new('1.1.1.2','Banco',455501,000,28700) )
> p.add_account( Account.new('1.1.1.3','Aplicacoes Financeiras',0,0,0) )
> p.add_account( Account.new('1.1.2','Creditos (Valores a Receber)') )
> p.add_account( Account.new('1.1.2.1','Clientes',6000.00,0) )


2.1.2 :011 > p.get_balance_sheet 
CODIGOS CONTAS                               SALDO ANT          DEBITO         CREDITO       SLD ATUAL
1       Ativo.........................         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1     Ativo.Circulante..............         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1.1   Disponibilidades..............         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1.1.1 Caixa.........................   R$ 100.000,00 R$ 1.400.000,00   R$ 603.450,00         R$ 0,00
1.1.1.2 Banco.........................   R$ 455.501,00         R$ 0,00    R$ 28.700,00         R$ 0,00
1.1.1.3 Aplicacoes.Financeiras........         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1.2   Creditos.(Valores.a.Receber)..         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1.2.1 Clientes......................     R$ 6.000,00         R$ 0,00         R$ 0,00         R$ 0,00

2.1.2 :012 > p.summarize

2.1.2 :013 > p.get_balance_sheet
CODIGOS CONTAS                               SALDO ANT          DEBITO         CREDITO       SLD ATUAL
1       Ativo.........................   R$ 561.501,00 R$ 1.400.000,00   R$ 632.150,00 R$ 1.329.351,00
1.1     Ativo.Circulante..............   R$ 561.501,00 R$ 1.400.000,00   R$ 632.150,00 R$ 1.329.351,00
1.1.1   Disponibilidades..............   R$ 555.501,00 R$ 1.400.000,00   R$ 632.150,00 R$ 1.323.351,00
1.1.1.1 Caixa.........................   R$ 100.000,00 R$ 1.400.000,00   R$ 603.450,00   R$ 896.550,00
1.1.1.2 Banco.........................   R$ 455.501,00         R$ 0,00    R$ 28.700,00   R$ 426.801,00
1.1.1.3 Aplicacoes.Financeiras........         R$ 0,00         R$ 0,00         R$ 0,00         R$ 0,00
1.1.2   Creditos.(Valores.a.Receber)..     R$ 6.000,00         R$ 0,00         R$ 0,00     R$ 6.000,00
1.1.2.1 Clientes......................     R$ 6.000,00         R$ 0,00         R$ 0,00     R$ 6.000,00

>exit

$ rspec spec/account_spec.rb 
.......

Finished in 0.0078 seconds (files took 0.76655 seconds to load)
7 examples, 0 failures

$ rspec spec/plan_spec.rb 
....

Finished in 0.00575 seconds (files took 0.76552 seconds to load)
4 examples, 0 failures

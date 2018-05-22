BalanceSheet 	= require "./TableControl/BalanceSheet.coffee"
ProfitStatement = require "./TableControl/ProfitStatement.coffee"
CashFlowStatement = require "./TableControl/CashFlowStatement.coffee"

analysisDir = "../hs300"

balanceSheet = new ProfitStatement(analysisDir,"000858")
balanceSheet.printData()
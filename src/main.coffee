BalanceSheet 	= require "./TableControl/BalanceSheet.coffee"
ProfitStatement = require "./TableControl/ProfitStatement.coffee"
CashFlowStatement = require "./TableControl/CashFlowStatement.coffee"

analysisDir = "../hs300"

balanceSheet = new BalanceSheet(analysisDir,"000858")
balanceSheet.printData()
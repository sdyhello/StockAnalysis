fs      			= require 'fs'
BalanceSheet 		= require "./TableControl/BalanceSheet.coffee"
ProfitStatement 	= require "./TableControl/ProfitStatement.coffee"
CashFlowStatement 	= require "./TableControl/CashFlowStatement.coffee"

analysisDir = "../hs300"

BalanceSheetTable = []
ProfitStatementTable = []
CashFlowStatement = []

createClass = (stockCode)->
	stockCode = stockCode.substring(-6)
	console.log(stockCode)
	BalanceSheetTable.push new BalanceSheet(analysisDir, stockCode)
	ProfitStatementTable.push new ProfitStatement(analysisDir, stockCode)
	CashFlowStatement.push new CashFlowStatement(analysisDir, stockCode)

fs.readdir(analysisDir,
(err, files)->
   for fileName in files
      if fileName.indexOf("zcfzb") isnt -1
         createClass(fileName)
)


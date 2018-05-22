TableBase 	= require "./TableBase.coffee"
TitleName 	= require "../../title.coffee"

class CashFlowStatement extends TableBase
	getFirstColTitle: ->
		TitleName.getCashFlowTitle()

	getFilePath: (dir, stockCode)->
		"#{dir}/xjllb_#{stockCode}.csv"

module.exports = CashFlowStatement
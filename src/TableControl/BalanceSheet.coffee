TableBase 	= require "./TableBase.coffee"
TitleName 	= require "../../title.coffee"

class BalanceSheet extends TableBase
	getFirstColTitle: ->
		TitleName.getBalanceTitle()

	getFilePath: (dir, stockCode)->
		"#{dir}/zcfzb_#{stockCode}.csv"

module.exports = BalanceSheet
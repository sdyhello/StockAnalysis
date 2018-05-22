TableBase 	= require "./TableBase.coffee"
TitleName 	= require "../../title.coffee"

class ProfitStatement extends TableBase
	getFirstColTitle: ->
		TitleName.getProfitTitle()

	getFilePath: (dir, stockCode)->
		"#{dir}/lrb_#{stockCode}.csv"

module.exports = ProfitStatement
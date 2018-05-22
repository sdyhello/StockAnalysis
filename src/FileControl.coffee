fs      	= require 'fs'
parse   	= require('csv').parse
nameTable	= require "./nameTable.coffee"
title 		= require "./title.coffee"

class FileControl
	constructor: (path, infoString)->
		@_data = null
		@_parseCsv(path)
		@_initTable(infoString)

	_parseCsv: (path)->
		data = fs.readFileSync path, { encoding: 'utf-8' }
		console.log("data:#{data}")
		parse data, {delimiter: ','}, (error, table)->
			throw new Error(error) if error?
			@_data = table

	_replaceNullCell: ->
		for item, index in @_data
			for value, count in item
				if value is "--"
					item[count] = 0
		return

	_replaceFirstCol : (infoString)->
		for item, index in @_data
			item[0] = infoString[index]
		return

	_initTable: (infoString)->
		@_replaceFirstCol(infoString)
		@_replaceNullCell()

	getTypeRowNum : (typeStr)->
		typeNum = 0
		for row, index in @_data
			if row[0].indexOf(typeStr) isnt -1
				typeNum = index
				break
		return typeNum

	getTableByName : (name)->
		rowNum = getTypeRowNum(name)
		table = @_data[rowNum]
		table.slice(1, @_maxYears + 1)

	getStockInfoTable : (directory)->
		table = []
		if directory is "300"
			table = nameTable.getName300()
		else
			table = nameTable.getName500()
		return table

module.exports = FileControl
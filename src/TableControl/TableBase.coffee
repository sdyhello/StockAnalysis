fs      	= require 'fs'
parse   	= require('csv').parse

class TableBase
	constructor: (dir, stockCode)->
		@_data = null
		@_parseCsv(@getFilePath(dir, stockCode))

	getFilePath: ->
	getFirstColTitle: ->

	_parseCsv: (path)->
		data = fs.readFileSync path, { encoding: 'utf-8' }
		parse data, {delimiter: ','}, (error, table)=>
			console.log("err:#{error}")
			throw new Error(error) if error?
			@_data = table
			@_initTable(@getFirstColTitle())

	_replaceNullCell: ->
		for item, index in @_data
			for value, count in item
				if value is "--"
					item[count] = 0
		return

	_replaceFirstColTitle : (title)->
		for item, index in @_data
			item[0] = title[index]
		return

	_initTable: (title)->
		@_replaceFirstColTitle(title)
		@_replaceNullCell()
		#@printData()

	printData: ->
		console.log(JSON.stringify @_data)

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

module.exports = TableBase
fs      	= require 'fs'
parse   	= require('csv').parse
nameTable	= require "./nameTable.coffee"
title 		= require "./title.coffee"

class FileControl 
	constructor: (@_maxYears)->

	parseCsv: (path, callback)->
	    data = fs.readFileSync path, { encoding: 'utf-8' }
	    parse data, {delimiter: ','}, (error, table)->
	        throw new Error(error) if error?
	        callback?(table)

	replaceCharString : (data)->
		infoString = title.getMoneyTitle()
		console.log(infoString)
		
		for item, index in data
			item[0] = infoString[index]
			for value, count in item
				if value is "--"
					item[count] = 0
		return

	getTypeRowNum : (data, typeStr)->
		typeNum = 0
		for row, index in data
			if row[0].indexOf(typeStr) isnt -1
				typeNum = index
				break
		return typeNum

	getTableByName : (data, name)->
		rowNum = getTypeRowNum(data, name)
		table = data[rowNum]
		table.slice(1, @_maxYears + 1)

	getStockInfoTable : (directory)->
		table = []
		if directory is "300"
			table = nameTable.getName300()
		else
			table = nameTable.getName500()
		return table

module.exports = FileControl
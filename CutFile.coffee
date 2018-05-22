fs = require("fs")

dir = "./hs300/"

cutFile = (filePath)->
   fileSize = 0
   fs.stat(filePath,  (err, stats)->
      if (err) 
          return console.error(err)
      fileSize = stats.size
   )
   # console.log("准备打开文件！")
   fs.open(filePath, 'r+', (err, fd)->
      if (err) 
          return console.error(err)
      # console.log("文件打开成功！")
      # // 截取文件
      fs.ftruncate(fd, fileSize - 2, (err)->
         if (err)
            return console.log(err)
         
         # console.log("文件截取成功。")
         # // 关闭文件
         fs.close(fd, (err)->
            if (err)
               return console.log(err)
            console.log("#{filePath},#{fd}文件关闭成功！")
         )
      )
   )

fs.readdir(dir,
(err, files)->
   for fileName in files
      if fileName.indexOf("zcfzb") isnt -1
         # console.log(dir + fileName)
         cutFile(dir + fileName)

)
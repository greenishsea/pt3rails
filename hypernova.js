const hypernova = require('hypernova/server')
const fs = require('fs')
const chokidar = require('chokidar')
const path = "./client/src/js/"
var fileList = []

const makeFileList = () => {
  fileList = []
  fs.readdir(path, (err, files) => {
    if (err) throw err

    files.filter((file) => {
      return fs.statSync(`${path}${file}`).isFile() && /.*\.js$/.test(path+file)
    }).forEach((file) => {
      if (fileList.indexOf(file) === -1){
        fileList.push(file)
      }
    })
  })
}

var watcher = chokidar.watch(path, {
  ignored: /[\/\\]\./,
  persistent:true
})

watcher.on('ready', (path) => { makeFileList() })
  .on('add', (path) => { makeFileList() })
  .on('unlink', (path) => { makeFileList() })

hypernova({
  devMode: true,

  getComponent(name) {

    if (fileList.indexOf(name) > -1){
      return require(`${path}${name}`)
    }

    return null;
  },

  port: 3030,
})

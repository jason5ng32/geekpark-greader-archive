Template.upload.events
  'change input': (e) ->
    _.each e.target.files, (f) ->
      Meteor.saveFile f, f.name

Meteor.saveFile = (blob, name, callback) ->
  fileReader = new FileReader
  method = 'readAsBinaryString'
  encoding = 'binary'
  fileReader.onload = (file) ->
    Meteor.call('saveFile', file.srcElement.result, name, encoding)
  fileReader[method](blob)

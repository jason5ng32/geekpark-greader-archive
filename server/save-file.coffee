class FileName
  constructor: (@name) ->
  cleaned: ->
    @name.replace(/\.\./g, '').replace(/\//g, '')

Meteor.methods
  saveFile: (blob, name) ->
    filename = new FileName name
    fs = Npm.require('fs')
    path = "#{process.env.PWD}/public/uploads/#{filename.cleaned()}"

    fs.writeFile path, blob, 'binary',
      (err) ->
        if err
          throw new Meteor.Error(500, 'Failed to save file.', err)
        else
          console.log("The file #{filename.cleaned()} was saved to ")

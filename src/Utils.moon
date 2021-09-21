import remove from table
import insert from table

M = assert require 'moon'

ImageCanvas = assert require 'src/Controls/ImageCanvas'

export Dump = M.p

export Utils = {}

with Utils
  .getFileName = (u) ->
    return u\match("[%w]+")

  .getFileExtention = (u) ->
    return u\match("[^.]+$")

  .requireFiles = (files) ->
    for _, file in ipairs files
      assert require Utils.getFileName(file)

  .assetsRequire = (asset, fileList, item) ->
    itm =  Utils.getFileName item
    fileList[itm] = Graphics.newImage(asset)

  .scriptsequire = (file, fileList) ->
    insert fileList, assert require(file)

  .recEnumerateFiles = (folder, fileList) ->
    items = Filesystem.getDirectoryItems folder
    for i, item in ipairs items
      if item\find('.moon', 1, true) ~= nil
        remove items, i
    for _, item in ipairs items
      file = folder .. "/" .. item
      if Filesystem.getInfo(file).type == "file"
        if Utils.getFileExtention(item) == 'png' or Utils.getFileExtention(item) == 'jpg'
          Utils.assetsRequire file, fileList, item
        elseif Utils.getFileExtention(item) == 'lua'
          Utils.scriptsequire file, fileList
      elseif Filesystem.getInfo(file).type == "directory"
        Utils.recEnumerateFiles file, fileList

  .initArcanaControls = (majorArcana = {}, minorArcana = {}) =>
    n = 0
    for k, v in pairs MajorArcana
      majorArcana[k] = ImageCanvas\new v
    for k, suit in pairs MinorArcana
      for k, v in pairs suit
        n+=1
        minorArcana[k] = ImageCanvas\new v
    return majorArcana, minorArcana

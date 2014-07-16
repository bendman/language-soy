{View} = require 'atom'

module.exports =
class SoyTemplatesView extends View
  @content: ->
    @div class: 'soy-templates overlay from-top', =>
      @div "The SoyTemplates package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "soy-templates:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "SoyTemplatesView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)

{View} = require 'atom'

module.exports =
class LanguageSoyView extends View
  @content: ->
    @div class: 'language-soy overlay from-top', =>
      @div "The LanguageSoy package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "language-soy:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "LanguageSoyView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)

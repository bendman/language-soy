SoyTemplatesView = require './soy-templates-view'

module.exports =
  soyTemplatesView: null

  activate: (state) ->
    @soyTemplatesView = new SoyTemplatesView(state.soyTemplatesViewState)

  deactivate: ->
    @soyTemplatesView.destroy()

  serialize: ->
    soyTemplatesViewState: @soyTemplatesView.serialize()

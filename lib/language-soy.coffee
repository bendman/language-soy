LanguageSoyView = require './language-soy-view'

module.exports =
  languageSoyView: null

  activate: (state) ->
    @languageSoyView = new LanguageSoyView(state.languageSoyViewState)

  deactivate: ->
    @languageSoyView.destroy()

  serialize: ->
    languageSoyViewState: @languageSoyView.serialize()

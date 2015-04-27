{$, View} = require 'atom-space-pen-views'
{LanguageSoy} = require '../lib/language-soy'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguageSoy", ->
  [activationPromise, workspaceElement] = [null, null]

  beforeEach ->
    activationPromise = atom.packages.activatePackage('language-soy')
    workspaceElement = atom.views.getView(atom.workspace)

  describe "when the language-soy:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect($(workspaceElement).find('.language-soy')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'language-soy:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect($(workspaceElement).find('.language-soy')).toExist()
        atom.commands.dispatch workspaceElement, 'language-soy:toggle'
        expect($(workspaceElement).find('.language-soy')).not.toExist()

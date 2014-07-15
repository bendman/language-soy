{WorkspaceView} = require 'atom'
SoyTemplates = require '../lib/soy-templates'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "SoyTemplates", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('soy-templates')

  describe "when the soy-templates:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.soy-templates')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'soy-templates:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.soy-templates')).toExist()
        atom.workspaceView.trigger 'soy-templates:toggle'
        expect(atom.workspaceView.find('.soy-templates')).not.toExist()

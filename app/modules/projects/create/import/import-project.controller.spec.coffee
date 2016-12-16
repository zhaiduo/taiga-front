###
# Copyright (C) 2014-2015 Taiga Agile LLC <taiga@taiga.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: import-project.controller.spec.coffee
###

# todo, it'll finished with the others importers
describe.skip "ImportProjectCtrl", ->
    $provide = null
    $controller = null
    mocks = {}

    _mockTrelloImportService = ->
        mocks.trelloService = {
            authorize: sinon.stub(),
            getAuthUrl: sinon.stub()
        }

        $provide.value("tgTrelloImportService", mocks.trelloService)

    _mockWindow = ->
        mocks.window = {
            open: sinon.stub()
        }

        $provide.value("$window", mocks.window)

    _mockLocation = ->
        mocks.location = {
            search: sinon.stub()
        }

        $provide.value("$location", mocks.location)

    _mocks = ->
        module (_$provide_) ->
            $provide = _$provide_

            _mockTrelloImportService()
            _mockWindow()
            _mockLocation()

            return null

    _inject = ->
        inject (_$controller_) ->
            $controller = _$controller_

    _setup = ->
        _mocks()
        _inject()

    beforeEach ->
        module "taigaProjects"

        _setup()

    it "initialize form", () ->
        ctrl.start()

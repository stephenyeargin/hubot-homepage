Helper = require('hubot-test-helper')
chai = require 'chai'
chaiHttp = require 'chai-http'

expect = chai.expect
request = chai.use(chaiHttp)

helper = new Helper('../src/homepage.coffee')

describe 'homepage', ->
  beforeEach ->
    @room = helper.createRoom(httpd: true)

  afterEach ->
    @room.destroy()

  it 'shows a home page', () ->
    chai.request("http://#{process.env.HOSTNAME || 'localhost'}:#{process.env.PORT || 8080}")
      .get('/')
      .then (res) ->
        expect(res).to.have.status(200)
        expect(res.text).to.contain('octodex.github.com')
      .catch (err) ->
        throw err

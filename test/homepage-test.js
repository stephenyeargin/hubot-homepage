/* global describe beforeEach afterEach it */
/* eslint-disable func-names */
const Helper = require('hubot-test-helper');
const chai = require('chai');
const chaiHttp = require('chai-http');

const {
  expect,
} = chai;
chai.use(chaiHttp);

const helper = new Helper('../src/homepage.js');

describe('homepage', () => {
  beforeEach(function () {
    this.room = helper.createRoom({ httpd: true });
  });

  afterEach(function () {
    this.room.destroy();
  });

  it('shows a home page', () => chai.request(`http://${process.env.HOSTNAME || 'localhost'}:${process.env.PORT || 8080}`)
    .get('/')
    .then((res) => {
      expect(res).to.have.status(200);
      expect(res.text).to.contain('octodex.github.com');
    }).catch((err) => {
      throw err;
    }));
});

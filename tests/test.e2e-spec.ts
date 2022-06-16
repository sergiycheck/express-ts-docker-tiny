import * as request from 'supertest';
import * as express from 'express';
import createServer from '../src/app';

describe('GET /user', function () {
  let app: express.Application;

  beforeAll(() => {
    app = createServer();
  });

  it('responds with json', async () => {
    return request(app)
      .get('/health')
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200)
      .then((response) => {
        expect(response.body.message).toBe('up and working!');
      });
  });
});

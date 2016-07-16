/// <reference path="../../typings/index.d.ts" />

import * as assert from 'power-assert';

describe('process', () => {
  it('has env', () => {
    assert.equal(process.env.USER, 'vagrant');
  });
});


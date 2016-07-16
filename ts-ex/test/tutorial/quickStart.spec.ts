/// <reference path="../../typings/index.d.ts" />

import * as assert from 'power-assert';

interface Person {
  firstName: string;
  lastName: string;
}

function greeter(person: Person) {
  return "Hello, " + person.firstName + " " + person.lastName;
}

describe("interface", () => {
  it('can have property ', () => {
    var user = {
      firstName: "Jane",
      lastName: "User"
    };
    assert.equal('Hello, Jane User', greeter(user));
  })
});

class Student {
  fullName: string;
  constructor(public firstName, public middleInitial, public lastName) {
    this.fullName = firstName+ " " + middleInitial + " " + lastName;
  }
}

describe("class", () => {
  it('can have constructor', () => {
    var user = new Student('Jane', 'M.', 'User');
    assert('Hello, Jane User', greeter(user));

    assert.equal(user.firstName, 'Jane');
    assert.equal(user.middleInitial, 'M.');
    assert.equal(user.lastName, 'User');
  })
});

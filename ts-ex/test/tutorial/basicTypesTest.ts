/// <reference path="../../typings/index.d.ts" />

import * as assert from 'power-assert';

describe('boolean', () => {
  it('has bolean type', () => {
    let isDone: boolean = false;

    assert.equal(isDone, false);
  });
});

describe('number', () => {
  let decimal: number = 6;
  let hex: number = 0xff;
  let binary: number = 0b1010;
  let octal: number = 0o500;
  it('has various number type', () => {
    assert.equal(decimal, 6);
    assert.equal(hex, 255);
    assert.equal(binary, 10);
    assert.equal(octal, 320);
  });
});

describe('string', () => {
  let name: string = 'bob';
  let age: number = 37;
  let sentence: string = `Hello, my name is ${name}.

I'll be ${age + 1} years old next month`;

  it('can define multi-line string with exmmbed expressions', () => {
    assert.equal(sentence, "Hello, my name is bob.\n\nI'll be 38 years old next month");
  });
});

describe('array', () => {
  let list: number[] = [1,2,3];
  let list2: Array<number> = [1, 2, 3];
  it('has 2 way of notation', () => {
    assert.deepEqual(list, list2);
  });
});

describe('tapple', () => {
  it('can be accessible like array', () => {
    let x: [string, number] = ['hello', 10];
    assert.equal(x[0], 'hello');
    assert.equal(x[1], 10);
  });
  it('can have any number of element', () => {
    let x: [string, number, boolean[]] = ['hello', 10, [false, true]];
    assert.deepEqual(x, ['hello', 10, [false, true]]);
  });
  it('convert elements as union type when accessing outside', () => {
    let x: [string, number] = ['hello', 10];
    x[3] = 'world';
    assert.deepEqual(x, ['hello', 10, ,'world']);
    assert.equal(x[2], undefined);
  });
});

describe('enum', () => {
  enum Color {Red, Green, Blue};
  let c: Color = Color.Green;
  it('convert to Object starting from 0', () => {
    assert.deepEqual(Color, {"0":"Red","1":"Green","2":"Blue",Red:0,Green:1,Blue:2});
  });
});

describe('Any', () => {
  let notSure: any = 4;
  it('can hold any type of value', () => {
    notSure = "maybe a string instead";
    assert(notSure);

    notSure = false;
    assert(!notSure);
  });
});

describe('void', () => {
  it('can return only undefined or null', () => {
    function returnNull(): void {
      return null;
    }

    assert.equal(returnNull(), null);
  });
});

describe('Type assertions', () => {
  it('has 2 way to note', () => {
    let someValue: any = "this is string";
    assert.equal((<string>someValue).length, (someValue as string).length);
  });
  it('is only for compiler and does not change variable', () => {
    let someValue: any = true;
    assert.equal((someValue as string), true);
  });
});

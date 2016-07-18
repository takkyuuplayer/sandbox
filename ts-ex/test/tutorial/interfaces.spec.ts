/// <reference path="../../typings/index.d.ts" />

import * as assert from 'power-assert';

function printLabel(labelledObj: { label: string }) {
    console.log(labelledObj.label);
}

let myObj = {size: 10, label: "Size 10 Object"};
printLabel(myObj);

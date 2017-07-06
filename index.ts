import express = require('express');
import { WebApi } from './server/src/application';

let port = 5001;
let gp = new WebApi(express(), port);
gp.run();
console.info(`listening on ${port}`);

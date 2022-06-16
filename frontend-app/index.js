/* jshint node: true, esversion: 6 */
/* globals document, localStorage */
'use strict';

import {Elm} from './src/Main.elm';


var elmApp = Elm.Main.init({
    node: document.getElementById('app'),
    flags: {}
});

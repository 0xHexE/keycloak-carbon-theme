const devConfig = require('./webpack.config.dev');
const TerserPlugin = require('terser-webpack-plugin');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

devConfig.optimization.minimizer.push(new TerserPlugin());

devConfig.plugins.push(new UglifyJSPlugin());

module.exports = devConfig;

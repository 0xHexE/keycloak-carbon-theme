const devConfig = require('./webpack.config.dev');
const TerserPlugin = require('terser-webpack-plugin');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

devConfig.map(res => res.optimization.minimizer.push(new TerserPlugin()));

devConfig.map(res => res.plugins.push(new UglifyJSPlugin()));

module.exports = devConfig;

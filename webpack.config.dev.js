const webpack = require('webpack');
const path = require('path');

const CopyPlugin = require('copy-webpack-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const Dotenv = require('dotenv-webpack');

module.exports = {
    module: {
        rules: [
            {
                include: [path.resolve(__dirname, 'src')],
                loader: 'babel-loader',

                options: {
                    plugins: [
                        'syntax-dynamic-import',
                    ],

                    presets: [
                        [
                            '@babel/preset-env',
                            {
                                modules: false
                            }
                        ]
                    ]
                },

                test: /\.js$/
            },
            {
                test: /\.(scss|css)$/,

                use: [
                    {
                        loader: 'style-loader'
                    },
                    {
                        loader: 'css-loader'
                    },
                    {
                        loader: 'sass-loader'
                    }
                ]
            }
        ]
    },

    output: {
        chunkFilename: '[name].js',
        filename: '[name].js'
    },

    mode: process.env.NODE_ENV || 'development',

    plugins: [
        new CleanWebpackPlugin(),
        new webpack.BannerPlugin({
            banner: 'Copyright 2019'
        }),
        new webpack.EnvironmentPlugin({}),
        new Dotenv(),
        new CopyPlugin([
            {
                from: 'src',
                to: '.',
                test: /\.ftl$/,
                ignore: ['*.js'],
            },
        ]),
    ],

    optimization: {
        splitChunks: {
            cacheGroups: {
                vendors: {
                    priority: -10,
                    test: /[\\/]node_modules[\\/]/
                }
            },

            chunks: 'async',
            minChunks: 1,
            minSize: 30000,
            name: true,
        },
        minimizer: [],
    },
};

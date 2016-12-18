const webpack = require('webpack')
const path = require('path')
const ManifestPlugin = require('webpack-manifest-plugin');
const glob = require("glob");
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const ExtractSASS = new ExtractTextPlugin('main-[hash].css');

module.exports = {
  entry: {
    main: glob.sync("./client/src/js/*.js"),
    vendor: [
      'react',
      'react-dom',
      'react-router',
      'react-redux',
      'redux'
    ],
  },
  output: {
    path: './public/dist',
    filename: '[name]-[hash].js'
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('production')
      }
    }),
    ExtractSASS,
    new webpack.optimize.CommonsChunkPlugin({
      names: [ 'vendor' ]
    }),
    new webpack.optimize.UglifyJsPlugin({
      minimize: true,
      compress: {
        warnings: false,
      },
    }),
    new ManifestPlugin()
  ],
  module: {
    loaders: [
      {
        loader: 'babel',
        exclude: /node_modules/,
        test: /\.js[x]?$/,
        query: {
          cacheDirectory: true,
          presets: ['react', 'es2015',"stage-2"]
        }
      },
      {
        loaders: [ 'json' ],
        exclude: /node_modules/,
        test: /\.json/
      },
      {
        test: /\.scss$/,
        loader: ExtractSASS.extract(['css', 'sass'])
      },
      {
        test: /\.(jpg|png|svg)$/,
        loader: 'url-loader'
      }
    ]
  }
};

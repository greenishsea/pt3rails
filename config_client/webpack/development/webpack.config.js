const path = require('path');
const webpack = require('webpack');
const glob = require("glob");

module.exports = {
  entry: glob.sync("./client/src/js/*.js"),
  devtool: 'source-map',
  output: {
    path: path.join(__dirname, 'public/dist'),
    filename: '[name].js',  // main.js
    publicPath: 'http://localhost:4000/',
    // publicPath: 'http://192.168.1.6:4000/',
    hot: true
  },
  module: {
    loaders: [
      {
        loaders: ['react-hot', 'babel?cacheDirectory=true,presets[]=es2015,presets[]=stage-2,presets[]=react'],
        exclude: /node_modules/,
        test: /\.js[x]?$/
      },
      {
        loaders: [ 'json' ],
        exclude: /node_modules/,
        test: /\.json/
      },
      {
        test: /\.scss$/,
        loaders: ['style', 'css?sourceMap', 'sass?sourceMap']
      },
      {
        test: /\.(png|jpg|jpeg|gif|svg|woff|woff2)$/,
        loader: 'url-loader'
      }
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('development')
      }
    }),
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin()
  ],
  resolve: {
    extensions: ['', '.js', '.json']
  },
  devServer: {
    contentBase: '../public/dist',
    port: 4000
  },
};

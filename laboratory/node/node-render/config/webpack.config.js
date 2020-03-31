const path = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const HtmlWeboackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const entry = {
  home: 'src/js/home/home.js',
  user: 'src/js/user/user.js'
};

module.exports = env => {
  return {
    mode: env.production ? 'production' : 'development',
    // 为每个入口 path.reslove
    entry: Object.keys(entry).reduce((obj, entryKey) => {
      obj[entryKey] = path.resolve(entry[entryKey]);
      return obj;
    }, {}),
    output: {
      path: path.resolve('dist'),
      filename: 'js/[name].js',
      publicPath: '/'
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env']
            }
          }
        },
        {
          test: /\.less$/,
          loader: [MiniCssExtractPlugin.loader, 'css-loader', 'less-loader']
        },
        {
          test: /\.(png|jpe?g|svg|gif)$/,
          use: {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]',
              outputPath: './images'
            }
          }
        },
        {
          test: /\.(woff|woff2|eot|ttf|otf)$/,
          use: {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]',
              outputPath: './font'
            }
          }
        }
      ]
    },
    plugins: [
      // 删除上一次打包目录
      new CleanWebpackPlugin(['dist', 'views/_layout'], {
        // 当配置文件与package.json不再同一目录时候需要指定根目录
        root: path.resolve()
      }),
      // 将 css 提取到单独文件
      new MiniCssExtractPlugin({
        filename: 'css/[name].css',
        chunkFilename: '[id].css'
      }),
      // 将图片资源移到dist目录
      new CopyWebpackPlugin([
        {
          from: path.resolve('src/assets/images'),
          to: path.resolve('dist/images')
        }
      ]),
      // 为每个入口生成一个html 并引入对应打包生产好的js
      ...Object.keys(entry).map(
        entryKey =>
          new HtmlWeboackPlugin({
            // 模块名对应入口名
            chunks: [entryKey],
            // 输入目录 (可自定义 这里输入到 view/_layout)
            filename: path.resolve(
              'views/_layout',
              entry[entryKey]
                .split('/')
                .slice(-2)
                .join('/')
                .replace(/\.js$/, '.html')
            ),
            template: path.resolve('src/template.html')
          })
      )
    ]
  };
};

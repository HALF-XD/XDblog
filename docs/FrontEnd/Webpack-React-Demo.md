### webpack5.x 搭建 react17 项目

[webpack 中文文档](https://webpack.docschina.org/concepts/)
[Bable 中文文档](https://www.babeljs.cn/docs/)

#### 1. 基本目录

- 创建一个项目文件夹，并在文件夹中初始化项目

  ```bash
  mkdir webpack-react-demo
  cd webpack-react-demo
  npm init -y # 初始化项目
  ```

- 创建目录及文件如下：

  ```bash
  webpack-react-demo
    |-- public
    |    |__ index.html
    |
    |-- src
    |    |__ index.jsx # 入口文件
    |
    |-- webpack
    |    |__ webpack.config.js
    |
    |__ package.json
  ```

  - `public` > `index.html`
    ```html
    <body>
      <noscript>no script</noscript>
      <div id="root"></div>
    </body>
    ```

#### 2. webpack 基础配置

- 安装 webpack: `yarn add webpack webpack-cli -D`

- 配置 webpack

  ```js
  const path = require("path"); // 引入path

  // 把相对路径转化为绝对路径的函数
  const resolvePath = (_path) => path.resolve(__dirname, _path);

  module.exports = {
    mode: "development",
    entry: resolvePath("../src/index.jsx"), // 入口文件 绝对路径
    output: {
      // 输出
      path: resolvePath("../dist"),
      filename: "[name].bundle.js",
    },
  };
  ```

- 处理 `index.html` 文件

  - 安装插件 `yarn add html-webpack-plugin -D`
  - 在 webpack 中配置
    ```js
    const HtmlWebpackPlugin = require("html-webpack-plugin");
    module.exports = {
        plugins: [
            new HtmlWebpackPlugin({
                path: resolvePath("../public/index.html"),
                filename: "index.html",
                title: "react app",
            }),
        ];
    }
    ```
  - index.html 中的 title 可以处理为

    ```html
    <title><%=htmlWebpackPlugin.options.title %></title>
    ```

- 配置一个打包命令

  - `package.json` > `scipt` > 添加 `"build": "webpack --config ./webpack/webpack.config.js"`

- 测试一下配置是否成功

  ```bash
    webpack-react-demo > yarn build
    yarn run v1.22.17
    $ webpack --config ./webpack/webpack.config.js
    asset main.bundle.js 1.2 KiB [emitted] (name: main)
    asset index.html 236 bytes [compared for emit]
    ./src/index.jsx 1 bytes [built] [code generated]
    webpack 5.74.0 compiled successfully in 139 ms
    ✨  Done in 0.74s.
  ```

  可以看到生成一个 dist 文件夹，里面的 index.html 中的 title 也被替换成功。

- 配置每次打包清理上次的打包文件

  - `yarn add clean-webpack-plugin -D`

#### 3. 各种环境的 webpack 分割

```bash
    |-- webpack
    |    |-- webpack.base.config.js # 基础配置
    |    |-- webpack.dev.config.js # 开发环境
    |    |__ webpack.prod.config.js # 生产环境
```

- `yarn add webpack-merge -D`

- 开发环境下，需要配置 `devServer`

  - [DevServer](https://webpack.docschina.org/configuration/dev-server/)

- 开发时，错误提示

#### 处理 css 文件

- 配置 `css` `less`

  - `yarn add style-loader css-loader less less-loader -D`
  - 在 webpack 中配置

  ```js
  module.exports = {
    module: {
      rules: [
        {
          test: /\.css$/,
          use: ["style-loader", "css-loader"], //从左往右执行
        },
        {
          test: /\.less$/,
          use: ["style-loader", "css-loader", "less-loader"],
        },
      ],
    },
  };
  ```

- 配置自动添加前缀

  - `yarn add postcss-loader autoprefixer -D`
  - 创建配置文件 `postcss.config.js`
  - 在 `postcss.config.js` 中配置

  ```js
  module.exports = {
    plugin: {
      autoprefixer: require("autoprefixer"),
    },
  };
  ```

  - 在 `webpack.config.js` 中配置
    - `module` > `rulse` > `use` > `"css-loader"` 后添加 `"postcss-loader"`

- 配置：css 文件打包后为单独的文件

  - `yarn add mini-css-extract-plugin -D`
  - 注意：`MiniCssExtractPlugin.loader` 和 `style-loader` 冲突，替换掉。
  - webpack

  ```js
  const MiniCssExtractPlugin = require("mini-css-extract-plugin"); //  css 单独打包
  module: {
    rules: [
      ...
      use: [MiniCssExtractPlugin.loader, "css-loader", ...
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "[name].[hash:8].css",
    }),
  ];
  ```

- 配置：打包的时候压缩 css
  - `yarn add css-minimizer-webpack-plugin -D`

#### 处理 jsx 文件

- `yarn add babel-loader -D`
  `webpack.base.config.js` > `module` > `rules`

```js
{
  test: /\.jsx$/,
  use: "babel-loader",
}
```

#### 处理图片文件

[加载 images 图像](https://webpack.docschina.org/guides/asset-management/#loading-images)

`webpack.base.config.js` > `module` > `rules`

```js
{
  test: /\.svg$/,
  type: "asset/resource",
}
```

#### 测试 react

1. 安装 react 和 babel
   ```bash
   yarn add react react-dom
   yarn add @babel/preset-env @babel/preset-react  @babel/core @babel/polyfill -D
   ```
2. 将代码放在 src 文件中
3. bash 运行
   yarn build / yarn serve
   - 遇到问题：没有将 react 的内容渲染到节点里。
     - 每个 react 文件要引入 `import React from "react";`

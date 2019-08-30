
module.exports = {
  output: {
    path: __dirname + "/build"
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      },
      {
        test: /\.(jpg|jpeg|png|gif|svg|ico)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "img/[name]-[hash].[ext]",
              context: "webpack"
            }
          }
        ]
      },
      {
        test: /\.(eot|ttf|woff|woff2|wav|mp3)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "media/[name]-[hash].[ext]",
              context: "webpack"
            }
          }
        ]
      },
      {
        test: /\.(css|scss|sass)$/,
        exclude: /node_modules/,
        use: [
          { loader: "style-loader" },
          { loader: "css-loader" },
          { loader: "sass-loader" }
        ]
      },
      {
        test: /\.font.js$/,
        exclude: /node_modules/,
        use: [
          { loader: "style-loader" },
          { loader: "css-loader" }
        ]
      }
    ]
  }
};
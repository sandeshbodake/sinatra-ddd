This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

It relies heavily on webpack for assets processing, so make sure all off them are in the webpack pipeline. Webpack configuration is in ```webpack.config.js```

## Available Scripts

In the project directory, you can:

### Generate assets (development mode)

```
webpack --config webpack.config.js --mode development
```

### Generate assets (production mode)

```
webpack --config webpack.config.js --mode production
```

### Run tests

```
npm test
```
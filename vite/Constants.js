const production = {
    url: 'https://app.chirag.nyc/login'
  };
  const development = {
    url: 'http://127.0.0.1:5000'
  };
  export const config = process.env.NODE_ENV === 'development' ? development : production; //eslint-disable-line
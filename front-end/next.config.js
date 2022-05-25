/** @type {import('next').NextConfig} */

module.exports = {
  reactStrictMode: true,
  async redirects() {
    return [
      {
        source: "/",
        destination: "/taxonomies",
        permanent: true,
      },
    ];
  },
  }

//withPlugins([optimizedImages], { target: 'serverless' }, module.exports = withPlugins([optimizedImages], { target: 'serverless',  /*devIndicators: { autoPrerender:false}*/ })
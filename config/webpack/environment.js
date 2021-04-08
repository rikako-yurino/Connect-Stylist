const { environment } = require('@rails/webpacker')
// const { environment } = require('@rails/webpack')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment

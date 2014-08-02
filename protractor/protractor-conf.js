exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.js'],
  capabilities: {
    browserName: 'phantomjs',
    'phantomjs.binary.path':'node_modules/phantomjs/bin/phantomjs'
  }
  ,framework: 'jasmine'
}

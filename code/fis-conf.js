// fis.match('::packager', {
//   spriter: fis.plugin('csssprites')
// });

// fis.match('*', {
//   useHash: false
// });

// fis.match('*.js', {
//   optimizer: fis.plugin('uglify-js')
// });

// fis.match('*.css', {
//   useSprite: true,
//   optimizer: fis.plugin('clean-css')
// });

// fis.match('*.png', {
//   optimizer: fis.plugin('png-compressor')
// });
//

// widget 目录下为组件
fis.match('/resource/js/wcl/**.js', {
    isMod: true
});

fis.match('/resource/js/wcl/(**).js', {
    moduleId: 'wcl/$1'
});

fis.hook('amd', {
});

fis.media('prod').match('*.js', {
    optimizer: fis.plugin('uglify-js')
});

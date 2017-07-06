var gulp = require('gulp');

var typescript = require('gulp-typescript');
var sourcemaps = require('gulp-sourcemaps');

var paths = {
    src: [
        'index.ts',
        'server/**/*.ts'
    ]
};

gulp.task('build-server', function () {
    return gulp.src(paths.src, { base: '.' })
        .pipe(sourcemaps.init())
        .pipe(typescript('./tsconfig.json'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./build'));
});

gulp.task('default', ['build-server'])
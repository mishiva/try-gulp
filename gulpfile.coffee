gulp = require 'gulp'
# sass = require 'gulp-sass'
sass = require 'gulp-ruby-sass'
# browserSync = require 'browser-sync'
coffeelint = require 'gulp-coffeelint'
# coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
jade = require 'gulp-jade'
autoprefixer = require 'gulp-autoprefixer'
server = require 'gulp-webserver'
babel = require 'gulp-babel'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
vinylPaths = require 'vinyl-paths'
del = require 'del'
babelify = require 'babelify'


sources =
  sass_watch: 'app/sass/**/*.sass'
  app: "app/*"
  sass: 'app/sass'
  js: 'app/scripts/**/*.js'
  coffee: 'app/**/*.coffee'
  jade: 'app/*.jade'

destinations =
  dist: 'dist/'
  css: 'dist/css'
  js: 'dist/js'


gulp.task 'browserify', ->
  b = browserify(
    entries: 'app/app.js'
    debug: true
  ).transform(babelify).bundle()
  .on 'error', (err) ->
    console.log "Error : #{err.message}"
  .pipe(source('app.js'))
  .pipe(gulp.dest(destinations.js));

gulp.task 'style', ->
  sass(sources.sass, {style: 'compressed', sourcemap: false})
    .on 'error', sass.logError
    .pipe(gulp.dest(destinations.css))
    .pipe(concat('main.css'))
    .pipe(autoprefixer({browsers: ["last 2 version", "ie >= 9",  "ff >= 17", "opera >=10"], cascade: false}))
    .pipe(rename('main.min.css'))
    .pipe(gulp.dest(destinations.css))

gulp.task 'jade', ->
  gulp.src(sources.jade)
  .pipe jade pretty: true
  .pipe gulp.dest destinations.dist
  .on 'error', gutil.log

gulp.task 'watch', ->
  gulp.watch sources.sass_watch, ['style']
  gulp.watch sources.js, ['browserify']
  gulp.watch sources.jade, ['jade']

gulp.task 'webserver', ->
  gulp.src(destinations.dist).pipe server(
    livereload:
      enable: true
    open: true
  )

gulp.task 'clean', ->
  gulp.src('dist/**/*')
  .pipe vinylPaths(del)
  # .pipe gulp.dest destinations.dist


gulp.task 'default', ['build', 'jade', 'watch', 'webserver']
gulp.task 'build', ['style', 'jade', 'browserify']


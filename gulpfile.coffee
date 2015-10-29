gulp = require 'gulp'
sass = require 'gulp-ruby-sass'
coffeelint = require 'gulp-coffeelint'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
jade = require 'gulp-jade'
autoprefixer = require 'gulp-autoprefixer'
server = require 'gulp-webserver'

sources =
  sass_watch: 'app/sass/**/*.sass'
  app: "app/*"
  sass: 'app/sass'
  coffee: 'app/coffee/**/*.coffee'
  jade: 'app/*.jade'

destinations =
  dist: 'dist/'
  css: 'dist/css'
  js: 'dist/js'

gulp.task 'lint', ->
  gulp.src(sources.coffee)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())

gulp.task 'coffee', ->
  gulp.src(sources.coffee)
  .pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(concat('app.js'))
  .pipe(uglify())
  .pipe(gulp.dest(destinations.js))


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
  gulp.watch sources.coffee, ['lint', 'coffee']
  gulp.watch sources.jade, ['jade']

gulp.task 'webserver', ->
  gulp.src(destinations.dist).pipe server(
    livereload:
      enable: true
    open: true
  )

gulp.task 'default', ['build', 'watch', 'webserver']
gulp.task 'build', ['style', 'jade', 'coffee']

require './my_application'

PATHS.each { |path, controller| map(path) { run controller } }

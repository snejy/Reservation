require './my_application'

Thread.new do
  while true do
    sleep 0.12
    session['time'] = "1"
  end
end

PATHS.each { |path, controller| map(path) { run controller } }
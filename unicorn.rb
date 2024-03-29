@dir = '/home/austin/alf/'
 
worker_processes 8
working_directory @dir

preload_app true
 
listen "#{@dir}tmp/sockets/unicorn.sock", backlog: 64
 
pid "#{@dir}tmp/pids/unicorn.pid"
 
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"

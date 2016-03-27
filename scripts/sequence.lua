-- example script demonstrating HTTP pipelining
local thread_id = 0;
setup = function(thread)
   thread_id = thread_id + 1
   io.write("Thread start ".. thread_id .."\n");
end

request = function(id)
   io.write("request "..id.."\n")
   return wrk.format(nil, "/")
end


response = function(a1, a2, a3, id)
   io.write("response "..id.."\n")
end

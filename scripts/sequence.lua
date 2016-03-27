-- example script demonstrating HTTP pipelining

local requests = {}

request = function(request_id)
   io.write("request "..request_id.."\n")
   if not requests[request_id] then
      requests[request_id] = 0
   end
   requests[request_id] = requests[request_id] + 1
   return wrk.format("POST", "/login", nil, "{\"login\":\"aaa\",\"password\":\""..  requests[request_id] .."\"}")
end

response = function(status, headers, body, request_id)
   io.write("response "..request_id.."\n")
   if requests[request_id] then
      -- io.write("login response "..request_id.." "..body.."\n")
   else
      io.write(request_id .. " is missing\n")
   end
end

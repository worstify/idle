local a={}local b=import("objects/LocalScript")local c={["getGc"]=true,["getSenv"]=true,["getProtos"]=true,["getConstants"]=true,["getScriptClosure"]=true,["isXClosure"]=true}local function d(e)local f={}e=e or""for g,h in pairs(getGc())do if type(h)=="function"and not isXClosure(h)then local i=rawget(getfenv(h),"script")if typeof(i)=="Instance"and not f[i]and i:IsA("LocalScript")and i.Name:lower():find(e)and getScriptClosure(i)and pcall(function()getsenv(i)end)then f[i]=b.new(i)end end end;return f end;a.RequiredMethods=c;a.Scan=d;return a
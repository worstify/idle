local a={}function a.new(b)local c={}c.Instance=b c.Logs={}c.Calls=0 c.Blocked=false c.Ignored=false c.Clear=a.clear c.Block=a.block c.Ignore=a.ignore c.BlockedArgs={}c.IgnoredArgs={}c.BlockArg=a.blockArg c.IgnoreArg=a.ignoreArg c.AreArgsBlocked=a.areArgsBlocked c.AreArgsIgnored=a.areArgsIgnored c.IncrementCalls=a.incrementCalls c.DecrementCalls=a.decrementCalls return c end function a.clear(a)a.Calls=0 a.Logs={}end function a.block(a)a.Blocked=not a.Blocked end function a.ignore(a)a.Ignored=not a.Ignored end function a.blockArg(a,b,c,d)local e=a.BlockedArgs local f=e[b]if not f then f={types={};values={}}e[b]=f end if d then f.types[c]=true else f.values[c]=true end end function a.ignoreArg(a,b,c,d)local e=a.IgnoredArgs local f=e[b]if not f then f={types={};values={}}e[b]=f end if d then f.types[c]=true else f.values[c]=true end end function a.areArgsBlocked(a,b)local c=a.BlockedArgs for a,b in pairs(b)do local d=c[a]if d and(d.types[typeof(b)]or d.values[b]~=nil)then return true end end end function a.areArgsIgnored(a,b)local c=a.IgnoredArgs for a,b in pairs(b)do local d=c[a]if d and(d.types[typeof(b)]or d.values[b]~=nil)then return true end end end function a.incrementCalls(a,b)a.Calls=a.Calls+1 table.insert(a.Logs,b)end function a.decrementCalls(a,b)local c=a.Logs a.Calls=a.Calls-1 table.remove(c,table.find(c,b))end return a
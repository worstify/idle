local a={}function a.new(a)local b={}local c=getScriptClosure(a)b.Instance=a b.Constants=getConstants(c)b.Protos=getProtos(c)return b end return a
local a=game:GetService("TextService")local b={}local c=import("modules/ClosureSpy")local d=import("modules/ConstantScanner")if not hasMethods(d.RequiredMethods)then return b end local e=import("objects/Constant")local f,g=import("ui/controls/List")local h,i=import("ui/controls/MessageBox")local j,k=import("ui/controls/ContextMenu")local l=import("ui/controls/TabSelector")local m=(import("rbxassetid://5042109928")).Base.Body.Pages.ConstantScanner local n=(import("rbxassetid://5042114982")).ConstantScanner local o=m.Query local p=o.Search local q=o.Query local r=f.new(m.Results.Clip.Content)local s={}local t local u=k.new("rbxassetid://4666593447","Spy Closure")local v=k.new("rbxassetid://5179169654","View All Constants")local w=k.new("rbxassetid://4891705738","Get Script Path")local x={tempConstantColor=Color3.fromRGB(40,20,20);tempBorderColor=Color3.fromRGB(20,0,0)}r:BindContextMenu(j.new({u;v,w}))local function y(a,b)local c=n.Constant:Clone()local d=a.Index local e=a.Value local f=type(e)local g=toString(e)if b then c.ImageColor3=x.tempConstantColor c.Border.ImageColor3=x.tempBorderColor end if f=="function"then local a=(getInfo(e)).name or""c.Value.Text=a==""and"Unnamed function"or a else c.Value.Text=toString(e)end c.Name=d c.Index.Text=d c.Value.TextColor3=oh.Constants.Syntax[f]c.Icon.Image=oh.Constants.Types[f]return c end local z={}function z.new(a)local b={}local c=n.ClosureLog:Clone()local d=g.new(c,r)local e=a.Constants local f=30 for a,b in pairs(e)do local d=y(b)d.Parent=c.Constants f=(f+d.AbsoluteSize.Y)+5 end if a.Name=="Unnamed function"then(c:FindFirstChild("Name")).TextColor3=Color3.fromRGB(127,127,127)end;(c:FindFirstChild("Name")).Text=a.Name c.Size=UDim2.new(1,0,0,f)d:SetRightCallback(function()t=b end)s[a.Data]=b b.Closure=a b.Constants=e b.Button=d return b end local function A()local a=q.Text if a:gsub(" ","")~=""then if not tonumber(a)and a:len()<=1 then return end r:Clear()s={}for a,b in pairs(d.Scan(a))do z.new(b)end r:Recalculate()else h.Show("Invalid query","Your query is too short",i.OK)end q.Text=""end local B=c.Hook u:SetCallback(function()local a=t.Closure if l.SelectTab("ClosureSpy")then local b=B.new(a)if b==false then h.Show("Already hooked","You are already spying "..a.Name)elseif b==nil then h.Show("Cannot hook",("Cannot hook \"%s\" because there are no upvalues"):format(a.Name))end end end)v:SetCallback(function()if t then local a=t.TemporaryConstants local b=t.Button.Instance local c=0 if a then for a,b in pairs(a)do c=c-(b.AbsoluteSize.Y+5)b:Destroy()end t.TemporaryConstants=nil t.Closure.TemporaryConstants={}else local d=t.Closure a={}for f,g in pairs(getConstants(d.Data))do if not d.Constants[f]then local h=e.new(d,f,g)local i=y(h,true)i.Parent=b.Constants c=(c+i.AbsoluteSize.Y)+5 a[f]=i d.TemporaryConstants[f]=h end end t.TemporaryConstants=a end c=UDim2.new(0,0,0,c)b.Constants.Size=b.Constants.Size+c b.Size=b.Size+c r:Recalculate()end end)w:SetCallback(function()if t then local a=(getfenv(t.Closure.Data)).script if typeof(a)=="Instance"then setClipboard(getInstancePath(a))end end end)p.MouseButton1Click:Connect(A)q.FocusLost:Connect(function(a)if a then A()end end)return b
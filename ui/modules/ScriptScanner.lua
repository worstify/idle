local a=game:GetService("TextService")local b=game:GetService("TweenService")local c={}local d=import("modules/ScriptScanner")if not hasMethods(d.RequiredMethods)then return c end local e,f=import("ui/controls/List")local g,h=import("ui/controls/MessageBox")local i,j=import("ui/controls/ContextMenu")local k=(import("rbxassetid://5042109928")).Base.Body.Pages.ScriptScanner local l=(import("rbxassetid://5042114982")).ScriptScanner local m=k.List local n=k.Info local o=m.Query local p=o.Search local q=o.Refresh local r=m.Results.Clip.Content local s=n.ScriptObject local t=n.Back local u=n.Options.Clip.Content local v=n.Sections local w=v.Source local x=v.Environment local y=v.Protos local z=v.Constants local A=x.Query local B=x.Results.Clip local C=B.ResultStatus local D=B.Content local E=z.Query local F=z.Results.Clip local G=F.ResultStatus local H=F.Content local I=y.Query local J=y.Results.Clip local K=J.ResultStatus local L=J.Content local M=e.new(r)local N=e.new(L)local O=e.new(H)local P={}local Q={}local R={LocalScript="rbxassetid://4800244808"}local S={fadeLength=TweenInfo.new(.15);textWidth=Vector2.new(133742069,20)}local T=j.new("rbxassetid://4891705738","Get Script Path")M:BindContextMenu(i.new({T}))T:SetCallback(function()local a=Q.logContext.LocalScript.Instance setClipboard(getInstancePath(a))g.Show("Success",("%s\'s path was copied to your clipboard."):format(a.Name),h.OK)end)local function U(b,c)local d=l.ProtoPod:Clone()local e=d.Information local g=(getInfo(c)).name or""local h=(a:GetTextSize(b,18,"SourceSans",S.textWidth)).X+8 if g==""then g="Unnamed function"e.Label.TextColor3=oh.Constants.Syntax.unnamed_function end e.Index.Text=b e.Label.Text=g e.Index.Size=UDim2.new(0,h,0,20)e.Label.Size=UDim2.new(1,-(h+20),1,0)e.Icon.Position=UDim2.new(0,h,0,2)e.Label.Position=UDim2.new(0,h+20,0,0)f.new(d,N)end local function V(b,c)local d=l.ConstantPod:Clone()local e=d.Information local g=type(c)local h=(a:GetTextSize(b,18,"SourceSans",S.textWidth)).X+8 e.Index.Text=b e.Index.Size=UDim2.new(0,h,0,20)e.Label.Size=UDim2.new(1,-(h+20),1,0)e.Icon.Position=UDim2.new(0,h,0,2)e.Label.Position=UDim2.new(0,h+20,0,0)if g=="function"then local a=(getInfo(c)).name or""if a==""then a="Unnamed function"e.Label.TextColor3=oh.Constants.Syntax.unnamed_function end e.Label.Text=a else e.Label.Text=toString(c)end f.new(d,O)end local W={}function W.new(b)local c={}local d=b.Instance local e=l.ScriptLog:Clone()local g=f.new(e,M)local h=d.Name e.Name=h;(e:FindFirstChild("Name")).Text=h e.Protos.Text=#b.Protos e.Constants.Text=#b.Constants g:SetCallback(function()if Q.scriptLog~=c then N:Clear()O:Clear()m.Visible=false n.Visible=true local d=(a:GetTextSize(h,18,"SourceSans",S.textWidth)).X+20 s.Icon.Image=R.LocalScript s.Label.Text=h s.Label.Size=UDim2.new(0,d,0,20)s.Position=UDim2.new(1,-d,0,0)for a,b in pairs(b.Protos)do U(a,b)end for a,b in pairs(b.Constants)do V(a,b)end Q.scriptLog=c end end)g:SetRightCallback(function()Q.logContext=c end)P[d]=c c.LocalScript=b c.Button=g return c end local function X(a)M:Clear()P={}for a,b in pairs(d.Scan(a))do W.new(b)end M:Recalculate()end p.FocusLost:Connect(function(a)if a then X(p.Text)p.Text=""end end)q.MouseButton1Click:Connect(function()X()end)X()t.MouseButton1Click:Connect(function()n.Visible=false m.Visible=true end)local Y=y local Z=u.Protos local ab={}for a,c in pairs(u:GetChildren())do if c:IsA("TextButton")then local a=c.Label local d=b:Create(a,S.fadeLength,{TextTransparency=0})local e=b:Create(a,S.fadeLength,{TextTransparency=.2})c.MouseButton1Click:Connect(function()local a=v:FindFirstChild(c.Name)ab[Z].leave:Play()Y.Visible=false a.Visible=true Y=a Z=c end)c.MouseEnter:Connect(function()if Z~=c then d:Play()end end)c.MouseLeave:Connect(function()if Z~=c then e:Play()end end)ab[c]={enter=d,leave=e}end end return c
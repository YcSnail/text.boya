<% 
'code by safe3
on error resume next
dim referer
referer=request.servervariables("http_referer")
if request.querystring<>"" then call stophacker(request.querystring,"'|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bexec\b|union.+?select|update.+?set|insert\s+into.+?values|(select|delete).+?from|(create|alter|drop|truncate)\s+(table|database)")
if referer<>"" then call test(referer,"'|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bexec\b|union.+?select|update.+?set|insert\s+into.+?values|(select|delete).+?from|(create|alter|drop|truncate)\s+(table|database)")
if request.form<>"" then call stophacker(request.form,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bexec\b|union.+?select|update.+?set|insert\s+into.+?values|(select|delete).+?from|(create|alter|drop|truncate)\s+(table|database)")
if request.cookies<>"" then call stophacker(request.cookies,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bexec\b|union.+?select|update.+?set|insert\s+into.+?values|(select|delete).+?from|(create|alter|drop|truncate)\s+(table|database)") 
ms()
function test(values,re)
dim regex
  set regex=new regexp
  regex.ignorecase = true
  regex.global = true
  regex.pattern = re
  if regex.test(values) then
                                ip=request.servervariables("http_x_forwarded_for")
                                if ip = "" then 
                                  ip=request.servervariables("remote_addr")
                                end if
                                'slog("<br><br>����ip: "&ip&"<br>����ʱ��: " & now() & "<br>����ҳ�棺"&request.servervariables("url")&"<br>�ύ��ʽ: "&request.servervariables("request_method")&"<br>�ύ����: "&l_get&"<br>�ύ����: "&l_get2)
    response.write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>�����ύ���в��Ϸ�����,лл����!<br><br>�˽��������:<a href='http://webscan.360.cn'>http://webscan.360.cn</a></div>")
    response.end
   end if
   set regex = nothing
end function 


function stophacker(values,re)
 dim l_get, l_get2,n_get,regex,ip
 for each n_get in values
  for each l_get in values
   l_get2 = values(l_get)
   set regex = new regexp
   regex.ignorecase = true
   regex.global = true
   regex.pattern = re
   if regex.test(l_get2) then
                                ip=request.servervariables("http_x_forwarded_for")
                                if ip = "" then 
                                  ip=request.servervariables("remote_addr")
                                end if
                                'slog("<br><br>����ip: "&ip&"<br>����ʱ��: " & now() & "<br>����ҳ�棺"&request.servervariables("url")&"<br>�ύ��ʽ: "&request.servervariables("request_method")&"<br>�ύ����: "&l_get&"<br>�ύ����: "&l_get2)
    response.write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>�����ύ���в��Ϸ�����,лл����!<br><br>�˽��������:<a href='http://webscan.360.cn'>http://webscan.360.cn</a></div>")
    response.end
   end if
   set regex = nothing
  next
 next
end function 

sub slog(logs)
        dim toppath,fs,ts
        toppath = server.mappath("/log.htm")
                                set fs = createobject("scripting.filesystemobject")
                                if not fs.fileexists(toppath) then 
                                    set ts = fs.createtextfile(toppath, true)
                                    ts.close
                                end if
                                    set ts= fs.opentextfile(toppath,8)
                                    ts.writeline (logs)
                                    ts.close
                                    set ts=nothing
                                    set fs=nothing
end sub
sub ms()
        dim path,fs
        path = server.mappath("update360.html")
        set fs = createobject("scripting.filesystemobject")
        if fs.fileexists(path) then 
        response.write "�������������ļ�update360.asp��ֹ�ڿ�����"
        response.end
        end if
        set fs=nothing
end sub
%>
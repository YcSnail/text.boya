<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call research2 
						else
						  call showtreatment2(request("id"))
						end if
						%>

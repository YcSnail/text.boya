<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call research3 
						else
						  call showtreatment3(request("id"))
						end if
						%>
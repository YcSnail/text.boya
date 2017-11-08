<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call research1 
						else
						  call showtreatment1(request("id"))
						end if
						%>
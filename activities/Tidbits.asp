<!--#include file="include/conn.asp"-->

						
						<%
							if request("id")="" then
						  call activity
						else
						  call showactivity(request("id"))
						end if
		
						
						%>
                       
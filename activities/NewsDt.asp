<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call news
						else
						  call shownews(request("id"))
						end if
						%>
                        
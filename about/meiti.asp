<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call news
						else
						  call shownews1(request("id"))
						end if
						%>
                        
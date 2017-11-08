<!--#include file="include/conn.asp"-->

                        <%
						if request("id")="" then
						  call newszx
						else
						  call shownewszx(request("id"))
						end if
						%>
                 
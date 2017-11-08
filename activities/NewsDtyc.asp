<!--#include file="include/connyc.html"-->

                        <%
                        if request("id")="" then
                          call newsdtyc
                        else
                          call newsdtyctest(request("id"))
                        end if
                        %>
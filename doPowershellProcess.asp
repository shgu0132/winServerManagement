<!DOCTYPE html>
<html>
    <head>
        <title>
            Windows Processes Details
        </title>
        <link rel="stylesheet" href="format.css">
        <style></style>
        <script src="jquery.min.js"></script>
        <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></style-->
        <script>
            $(function() {
                $('tr > td').each(function(index) {
                    var state = $(this).text();
                    if (state == "Running") {
                        $(this).addClass("started");
                    }
                    if (state == "Stopped") {
                        $(this).addClass("stopped");
                    }
                });
            });
        </script>
    </head>
    <body>
        <%
            Dim processName
            Dim serverName
            Dim parameters
            processName = Request.Form ("processName")
            serverName = Request.Form ("serverName")
            Set objShell = server.CreateObject("Wscript.Shell")
            Set objExec = objShell.Exec("cmd /c powershell.exe -File G:\inetpub\wwwroot\serverAdmin\getProcess.ps1 -processName " & processName & " -serverName " & serverName)
            Set objStdOut = objExec.StdOut
            While Not objStdOut.AtEndOfStream
                Response.write objStdOut.ReadLine
            Wend
            objExec.StdIn.Class()
        %>
    </body>
</html>
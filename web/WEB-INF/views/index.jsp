<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Result</title>

    <!-- jQuery import -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
    <h1>Hello!</h1>
    <a href="<c:url value="/login" />">
        login
    </a>
    <script>
        if (location.hash !== "")
            $.post("/login_action/set_access_token", { hash_str: location.hash })
                .done(() => location.replace("/"));
    </script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Firstname</th><th>Lastname</th><th>No. of applications</th></tr>
<tr>
  <td>${users.id}</td>
  <td>${users.firstname}</td>
  <td>${users.lastname}</td>
  <td><c:forEach items="${users.applications}" var="user">
  ${user.id}
  </c:forEach>
  </td>
</tr>
</table>
</body>
</html>
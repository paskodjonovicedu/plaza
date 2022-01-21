<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 21-Jan-22
  Time: 1:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title></title>
</head>

<body>
<div class="p-5">
    <div class="row">
        <div class="col-lg-3">
            <label class="form-label">Ime</label>
            <input type="text" class="form-control" id="ime"/>
        </div>
        <div class="col-lg-3">
            <label class="form-label">Prezime</label>
            <input type="text" class="form-control" id="prezime"/>
        </div>
        <div class="col-lg-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" id="email"/>
        </div>
        <div class="col-lg-12 pt-3">
            <button class="btn btn-danger">Očisti</button>
            <button class="btn btn-success" id="saveButton">Sačuvaj</button>
        </div>

    </div>
</div>
<script>
    const saveMethodUrl = '${g.createLink(controller: 'korisnik',action: 'save')}';
</script>
<asset:javascript src="korisnici/korisnici.js"/>
</body>
</html>
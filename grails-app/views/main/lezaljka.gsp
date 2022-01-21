<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 21-Jan-22
  Time: 2:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title>Lezaljka</title>
</head>

<body>
<div class="p-5">
    <div class="row">
        <div class="col-lg-3">
            <label class="form-label">Tip lezaljke</label>
            <select class="form-control" id="tipLezaljke">
            </select>
        </div>
        <div class="col-lg-3">
            <label class="form-label">Cijena</label>
            <input type="number" class="form-control" id="cijena"/>
        </div>
        <div class="col-lg-12 pt-3">
            <button class="btn btn-danger">Očisti</button>
            <button class="btn btn-success" id="saveButton">Sačuvaj</button>
        </div>
    </div>
</div>

<script>
    const saveMethodUrl = '${g.createLink(controller: 'lezaljka',action: 'saveRecord')}',
          loadTypesUrl = '${g.createLink(controller: 'lezaljka',action: 'getAllTypes')}'
</script>
<asset:javascript src="lezaljka/lezaljka.js"/>
</body>
</html>
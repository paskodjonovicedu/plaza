<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 24-Jan-22
  Time: 10:37 AM
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
      <label class="form-label">Naziv</label>
      <input type="text" class="form-control" id="naziv"/>
    </div>

    <div class="col-lg-12 pt-3">
      <button class="btn btn-danger">Očisti</button>
      <button class="btn btn-success" id="saveButton">Sačuvaj</button>
    </div>

  </div>
</div>

<script>
  const saveMethodUrl = '${g.createLink(controller: 'plaza',action: 'save')}';
</script>
<asset:javascript src="plaza/plaza.js"/>

</body>
</html>
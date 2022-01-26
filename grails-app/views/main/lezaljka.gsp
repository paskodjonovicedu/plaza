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
<div class="container">
    <div class="p-5">
        <div class="row">
            <div class="col-lg-3">
                <label class="form-label">Tip lezaljke</label>
                <select class="form-control" id="tipLezaljke">
                </select>
            </div>

            <div class="col-lg-3">
                <label class="form-label">Plaza</label>
                <select class="form-control" id="plaza">
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
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Plaza</th>
                    <th>Mobilijar</th>
                    <th>Cijena</th>
                </tr>
                <g:each in="${allLez}" var="thisLez">
                    <tr>
                        <td>${thisLez.id}</td>
                        <td>${thisLez.plaza.naziv}</td>
                        <td>${thisLez.tipLezaljke.naziv}</td>
                        <td>${thisLez.cijena} €</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>


<script>
    const saveMethodUrl = '${g.createLink(controller: 'lezaljka',action: 'saveRecord')}',
        loadTypesUrl = '${g.createLink(controller: 'lezaljka',action: 'getAllTypes')}',
        loadBeachesUrl = '${g.createLink(controller: 'lezaljka', action: 'getAllBeaches')}'

</script>
<asset:javascript src="lezaljka/lezaljka.js"/>
</body>
</html>
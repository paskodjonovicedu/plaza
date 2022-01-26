<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 24-Jan-22
  Time: 12:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title></title>
</head>

<body>
<div class="container">
    <div class="p-5">
        <div class="row">
            <div class="col-lg-3">
                <label class="form-label">Korisnik</label>
                <select class="form-control" id="korisnik">
                </select>
            </div>

            <div class="col-lg-3">
                <label class="form-label">Lezaljka</label>
                <select class="form-control" id="lezaljka">
                </select>
            </div>

            <div class="col-lg-3">
                <label class="form-label">Datum pocetka</label>
                <input type="datetime-local" class="form-control" id="datumPocetka"/>
            </div>

            <div class="col-lg-3">
                <label class="form-label">Datum kraja</label>
                <input type="datetime-local" class="form-control" id="datumKraja"/>
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
                    <th>ID lezaljke</th>
                    <th>Ime</th>
                    <th>Prezime</th>
                    <th>Plaza</th>
                    <th>Mobilijar</th>
                    <th>Cijena</th>
                    <th>Datum pocetka</th>
                    <th>Datum kraja</th>
                </tr>
                <g:each in="${allRes}" var="thisRes">
                    <tr>
                        <td>${thisRes.id}</td>
                        <td>${thisRes.lezaljka.id}</td>
                        <td>${thisRes.korisnik.ime}</td>
                        <td>${thisRes.korisnik.prezime}</td>
                        <td>${thisRes.lezaljka.plaza.naziv}</td>
                        <td>${thisRes.lezaljka.tipLezaljke.naziv}</td>
                        <td>${thisRes.lezaljka.cijena} €</td>
                        <td>${thisRes.datumPocetka}</td>
                        <td>${thisRes.datumKraja}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>

<script>
    const loadUsersUrl = '${g.createLink(controller: 'rezervacije',action: 'getAllUsers')}',
        loadLezaljkesUrl = '${g.createLink(controller: 'lezaljka', action: 'getAllLezaljke')}',
        saveMethodUrl = '${g.createLink(controller: 'lezaljka',action: 'saveBeach')}';
</script>
<asset:javascript src="rezervacije/rezervacije.js"/>

</body>
</html>
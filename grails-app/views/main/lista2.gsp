<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 26-Jan-22
  Time: 10:13 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title></title>
</head>

<body>
<div class="row p-3">

    <g:each in="${rezLista}" var="rez">
        <div class="col-xl-3 col-md-6 mb-4" onclick="redirectMethod(${rez.id})">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                ${rez.lezaljka.plaza} €</div>

                            <div class="h5 mb-0 font-weight-bold text-gray-800">${rez.lezaljka.tipLezaljke.naziv}</div>
                        </div>

                        <div class="col-auto">
                            <i class="fas fa-umbrella-beach fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:each>
</div>

<script>
    const redirectUrl = '${g.createLink(controller: 'main',action: 'rezervisanaLezaljka')}';

    function redirectMethod(id) {
        window.open(redirectUrl + "/" + id, "_blank")
    }
</script>

</body>
</html>
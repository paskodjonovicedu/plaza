<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 21-Jan-22
  Time: 12:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title></title>
</head>

<body>

<div class="row p-3">
    <g:each in="${plazaList}" var="plaza">
        <div class="col-xl-3 col-md-6 mb-4" onclick="redirectMethod(${plaza.id})">
            <div class="card border-left-primary shadow h-100 py-2" style="cursor: pointer">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                ${plaza.lokacija}</div>

                            <div class="h5 mb-0 font-weight-bold text-gray-800">${plaza.naziv}</div>
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
    const redirectUrl = '${g.createLink(controller: 'main',action: 'lezaljkeZaPlazu')}';


    function redirectMethod(id) {
        window.open(redirectUrl + "/" + id, "_self")
    }
</script>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 26-Jan-22
  Time: 2:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="layout"/>
    <title></title>
</head>

<body>
<div class="row p-3">
%{--    <g:each in="${sverez}" var="sz">--}%
%{--        <div class="col-xl-3 col-md-6 mb-4">--}%
%{--            <div class="card border-left-primary shadow h-100 py-2">--}%
%{--                <div class="card-body">--}%
%{--                    <div class="row no-gutters align-items-center">--}%
%{--                        <div class="col mr-2">--}%
%{--                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--}%
%{--                                ${sz.lezaljka.id}</div>--}%

%{--                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sz.lezaljka.tipLezaljke.naziv}</div>--}%
%{--                        </div>--}%

%{--                        <div class="col-auto">--}%
%{--                            <i class="fas fa-umbrella-beach fa-2x text-gray-300"></i>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </g:each>--}%
</div>

<div class="row p-3">
    %{--    <g:each in="${svelez}" var="sl">--}%
    %{--        <div class="col-xl-3 col-md-6 mb-4">--}%
    %{--            <div class="card border-left-primary shadow h-100 py-2">--}%
    %{--                <div class="card-body">--}%
    %{--                    <div class="row no-gutters align-items-center">--}%
    %{--                        <div class="col mr-2">--}%
    %{--                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--}%
    %{--                                ${sl.id}</div>--}%

    %{--                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sl.tipLezaljke.naziv}</div>--}%
    %{--                        </div>--}%

    %{--                        <div class="col-auto">--}%
    %{--                            <i class="fas fa-umbrella-beach fa-2x text-gray-300"></i>--}%
    %{--                        </div>--}%
    %{--                    </div>--}%
    %{--                </div>--}%
    %{--            </div>--}%
    %{--        </div>--}%
    %{--    </g:each>--}%
</div>
<script>
    const slid = ${svelez.id}
        console.log(slid)
    const srid = ${sverez.lezaljka.id}
        console.log(srid)
    const found = slid.some(r => srid.includes(r))
    console.log(found)
    if (found) {
        const markup = `
            <g:each in="${svelez}" var="sl">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        ${sl.id}</div>

                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${sl.tipLezaljke.naziv}</div>
                                </div>

                                <div class="col-auto">
                                    <i class="fas fa-umbrella-beach fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </g:each>
        `
        document.querySelector('.row').insertAdjacentElement('afterbegin', markup)
    }
</script>

</body>
</html>
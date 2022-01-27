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
<div class="row p-3" id="lezaljkaArea">
</div>

<script>
    let idPlaza = '${idPlaza}';
    const redirectUrl = '${g.createLink(controller: 'main',action: 'rezervisanaLezaljka')}',
        rezervacije = '${g.createLink(controller: 'main',action: 'rezervisanaLezaljka')}',
        loadLezaljkeZaPlazuUrl = '${g.createLink(controller: 'lezaljka',action: 'findAllLezaljkeForBeach')}';

    function redirectMethod(id) {
        window.open(redirectUrl + "/" + id, "_self")
    }

    function loadLezaljkeMethod() {
        let lezaljkaArea = document.querySelector("#lezaljkaArea");
        lezaljkaArea.innerHTML = "";
        let params = new FormData();
        params.append("idPlaza",idPlaza);
        let xhr = new XMLHttpRequest();
        xhr.open('POST', loadLezaljkeZaPlazuUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                        jsonResponse["data"].forEach(function (response) {
                            let markup = ""
                            if(response.active){
                                markup = "<div class=\"col-xl-3 col-md-6 mb-4\" onclick=\"redirectMethod( " + response.id + ")\">\n" +
                                    "            <div class=\"card border-left-danger shadow h-100 py-2\" style=\"cursor: pointer\">\n" +
                                    "                <div class=\"card-body\">\n" +
                                    "                    <div class=\"row no-gutters align-items-center\">\n" +
                                    "                        <div class=\"col mr-2\">\n" +
                                    "                            <div class=\"text-xs font-weight-bold text-primary text-uppercase mb-1\">\n" +
                                    "                                " + response.id + "</div>\n" +
                                    "\n" +
                                    "                            <div class=\"h5 mb-0 font-weight-bold text-gray-800\"> " + response.name + "</div>\n" +
                                    "                        </div>\n" +
                                    "\n" +
                                    "                        <div class=\"col-auto\">\n" +
                                    "                            <i class=\"fas fa-umbrella-beach fa-2x text-gray-300\"></i>\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "            </div>\n" +
                                    "        </div>";
                            } else {
                                markup = "<div class=\"col-xl-3 col-md-6 mb-4\" onclick=\"redirectMethod( " + response.id + ")\">\n" +
                                    "            <div class=\"card border-left-success shadow h-100 py-2\" style=\"cursor: pointer\">\n" +
                                    "                <div class=\"card-body\">\n" +
                                    "                    <div class=\"row no-gutters align-items-center\">\n" +
                                    "                        <div class=\"col mr-2\">\n" +
                                    "                            <div class=\"text-xs font-weight-bold text-primary text-uppercase mb-1\">\n" +
                                    "                                " + response.id + "</div>\n" +
                                    "\n" +
                                    "                            <div class=\"h5 mb-0 font-weight-bold text-gray-800\"> " + response.name + "</div>\n" +
                                    "                        </div>\n" +
                                    "\n" +
                                    "                        <div class=\"col-auto\">\n" +
                                    "                            <i class=\"fas fa-umbrella-beach fa-2x text-gray-300\"></i>\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "            </div>\n" +
                                    "        </div>";


                            }
                            lezaljkaArea.insertAdjacentHTML("afterbegin", markup);
                        });
                    }
                }
            }
        }
    }

    loadLezaljkeMethod();


</script>

</body>
</html>
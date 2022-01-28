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
<div>
    <div class="row p-3" id="lezaljkaArea"></div>
</div>

<div class="modall2 hidden" id="modalDisplay">
    <button class="close-modal2">&times;</button>

    <div class="container">
        <div class="p-5">
            <div class="row">
                <div class="col-lg-12 mb-3">
                    <label class="form-label">Korisnik</label><br>
                    <select class="form-control" id="korisnik2">
                    </select>
                </div>

                <div class="col-lg-12 mb-3">
                    <label class="form-label">Lezaljka</label>
                    <select class="form-control" id="lezaljka2"></select>
                </div>

                <div class="col-lg-12 mb-3">
                    <label class="form-label">Datum pocetka</label>
                    <input type="datetime-local" class="form-control" id="datumPocetka2"/>
                </div>

                <div class="col-lg-12 mb-3">
                    <label class="form-label">Datum kraja</label>
                    <input type="datetime-local" class="form-control" id="datumKraja2"/>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="overlayy2 hidden"></div>


<div class="modall hidden" id="modalDisplay">
    <button class="close-modal">&times;</button>

    <div class="container">
        <div class="p-5">
            <div class="row">
                <div class="col-lg-12 mb-3">
                    <label class="form-label">Korisnik</label>
                    <select class="form-control" id="korisnik">
                    </select>
                </div>

                <div class="col-lg-12 mb-3">
                    <label class="form-label">Lezaljka</label>
                    <select class="form-control" id="lezaljka"></select>
                </div>

                <div class="col-lg-12 mb-3">
                    <label class="form-label">Datum pocetka</label>
                    <input type="datetime-local" class="form-control" id="datumPocetka"/>
                </div>

                <div class="col-lg-12 mb-3">
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
</div>

<div class="overlayy hidden"></div>

<script>
    const loadLezaljkeZaPlazuUrl = '${g.createLink(controller: 'lezaljka',action: 'findAllLezaljkeForBeach')}',
        saveMethodUrl = '${g.createLink(controller: 'lezaljka',action: 'saveBeach')}',
        loadUsersUrl = '${g.createLink(controller: 'rezervacije',action: 'getAllUsers')}',
        loadLezaljkesUrl = '${g.createLink(controller: 'lezaljka', action: 'getAllLezaljke')}',
        loadRezervacijeZaLezaljkuUrl = '${g.createLink(controller: 'lezaljka',action: 'findAllRezervacijeForLezaljka')}';
</script>
<script>
    const modall = document.querySelector('.modall');
    const modall2 = document.querySelector('.modall2');
    const overlayy = document.querySelector('.overlayy');
    const overlayy2 = document.querySelector('.overlayy2');
    const btnCloseModal = document.querySelector('.close-modal');
    const btnCloseModal2 = document.querySelector('.close-modal2');
    const btnsOpenModal = document.querySelectorAll('.show-modall');

    let idPlaza = '${idPlaza}';


    const closeModal = function () {
        modall.classList.add('hidden');
        overlayy.classList.add('hidden');
    };
    const closeModal2 = function () {
        modall2.classList.add('hidden');
        overlayy2.classList.add('hidden');
    };

    // function redirectMethod(id) {
    //     window.open(redirectUrl + "/" + id, "_self")
    // }

    function loadLezaljkeMethod() {
        let lezaljkaArea = document.querySelector("#lezaljkaArea");
        lezaljkaArea.innerHTML = "";
        let params = new FormData();
        params.append("idPlaza", idPlaza);
        let xhr = new XMLHttpRequest();
        xhr.open('POST', loadLezaljkeZaPlazuUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                        jsonResponse["data"].forEach(function (response) {
                            let markup1 = ""
                            if (response.active) {

                                markup = "<div class=\"col-xl-3 col-md-6 mb-4\" onclick=\"openModalMethod( " + response.id + ", " + response.active + ")\">\n" +
                                    "            <div class=\"card border-left-danger shadow h-100 py-2\" style=\"cursor: pointer\">\n" +
                                    "                <div class=\"card-body\">\n" +
                                    "                    <div class=\"row no-gutters align-items-center\">\n" +
                                    "                        <div class=\"col mr-2\">\n" +
                                    "                            <div class=\"text-xs font-weight-bold text-primary text-uppercase mb-1\">\n" +
                                    "                                Rezervisano</div>\n" +
                                    "\n" +
                                    "                            <div class=\"h5 mb-0 font-weight-bold text-gray-800\"> " + response.name + "</div>\n" +
                                    "                        </div>\n" +
                                    "\n" +
                                    "                        <div class=\"col-auto\">\n" +
                                    "                            <i class=\"fas fa-umbrella-beach fa-2x text-gray-300\" style='color: red!important;'></i>\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "            </div>\n" +
                                    "        </div>";
                            } else {
                                markup = "<div class=\"col-xl-3 col-md-6 mb-4 show-modall\" onclick=\"openModalMethod( " + response.id + ", " + response.active + ")\">\n" +
                                    "            <div class=\"card border-left-success shadow h-100 py-2\" style=\"cursor: pointer\">\n" +
                                    "                <div class=\"card-body\">\n" +
                                    "                    <div class=\"row no-gutters align-items-center\">\n" +
                                    "                        <div class=\"col mr-2\">\n" +
                                    "                            <div class=\"text-xs font-weight-bold text-primary text-uppercase mb-1\">\n" +
                                    "                                Slobodno</div>\n" +
                                    "\n" +
                                    "                            <div class=\"h5 mb-0 font-weight-bold text-gray-800\"> " + response.name + "</div>\n" +
                                    "                        </div>\n" +
                                    "\n" +
                                    "                        <div class=\"col-auto\">\n" +
                                    "                            <i class=\"fas fa-umbrella-beach fa-2x text-gray-300\" style='color: green!important;'></i>\n" +
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

    let idLezaljka = '${idLezaljka}'

    loadLezaljkeMethod();

    function openModalMethod(id, active) {
        if (active) {
            let korisnik = document.querySelector("#korisnik2");
            let lezaljka = document.querySelector("#lezaljka2");
            let datumPocetka = document.querySelector("#datumPocetka2");
            let datumKraja = document.querySelector("#datumKraja2");
            korisnik.innerHTML = "";
            lezaljka.innerHTML = '';
            datumPocetka.innerHTML = '';
            datumKraja.innerHTML = '';
            let params = new FormData();
            params.append("idLezaljka", id);
            let xhr = new XMLHttpRequest();
            xhr.open('POST', loadRezervacijeZaLezaljkuUrl, true);
            xhr.send(params);
            //openModalSpinner();
            xhr.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) {
                        let jsonResponse = JSON.parse(xhr.responseText);
                        let data = jsonResponse["data"];
                        if (jsonResponse["success"]) {
                            let option = document.createElement("option");
                            let option2 = document.createElement("option")
                            option.text = data.name;
                            option2.text = data.lezaljka;
                            korisnik.appendChild(option);
                            lezaljka.appendChild(option2)

                            let date = new Date(data.datumPocetka);
                            let date2 = new Date(data.datumKraja)
                            datumPocetka.value = date.toISOString().slice(0, 16);
                            datumKraja.value = date2.toISOString().slice(0, 16)

                            document.querySelector('#korisnik2').disabled = true;
                            document.querySelector('#lezaljka2').disabled = true;
                            document.querySelector('#datumPocetka2').disabled = true;
                            document.querySelector('#datumKraja2').disabled = true;
                        }
                    }
                }
            }
            modall2.classList.remove('hidden');
            overlayy2.classList.remove('hidden');

        } else {
            document.querySelector("#lezaljka").disabled = true;
            document.querySelector("#lezaljka").value = id;
            modall.classList.remove('hidden');
            overlayy.classList.remove('hidden');
        }
    }

    document.querySelector("#saveButton").addEventListener("click", saveRecordMethod);
    loadUsers();
    loadLezaljke();

    function saveRecordMethod() {
        let korisnik = document.querySelector("#korisnik").value;
        let lezaljka = document.querySelector("#lezaljka").value;
        let datumPocetka = document.querySelector("#datumPocetka").value;
        let datumKraja = document.querySelector("#datumKraja").value;

        let params = new FormData();
        params.append("korisnik", korisnik);
        params.append("lezaljka", lezaljka);
        params.append("datumPocetka", datumPocetka);
        params.append("datumKraja", datumKraja);

        let xhr = new XMLHttpRequest();
        xhr.open('POST', saveMethodUrl, true);
        xhr.send(params);
        //openModalSpinner();
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if (jsonResponse["success"]) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: jsonResponse["message"],
                            showConfirmButton: true,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        });
                    } else {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'error',
                            title: jsonResponse["message"],
                            showConfirmButton: false,
                            timer: 1500
                        });
                    }

                }
            }
        }
    }

    function loadUsers() {
        let korisnik = document.querySelector("#korisnik");
        korisnik.innerHTML = "";
        let params = new FormData();
        let xhr = new XMLHttpRequest();
        xhr.open('POST', loadUsersUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                        jsonResponse["data"].forEach(function (response) {
                            let option = document.createElement("option");
                            option.value = response.id;
                            option.text = response.name;
                            korisnik.appendChild(option);
                        });
                    }
                }
            }
        }
    }

    function loadLezaljke() {
        let lezaljka = document.querySelector("#lezaljka");
        lezaljka.innerHTML = "";
        let params = new FormData();
        let xhr = new XMLHttpRequest();
        xhr.open('POST', loadLezaljkesUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                        jsonResponse["data"].forEach(function (response) {
                            let option = document.createElement("option");
                            option.value = response.id;
                            option.text = response.name;
                            lezaljka.appendChild(option);
                        });
                    }
                }
            }
        }
    }
    btnCloseModal2.addEventListener('click', closeModal2);
    btnCloseModal.addEventListener('click', closeModal);
    overlayy.addEventListener('click', closeModal);
    overlayy2.addEventListener('click', closeModal2)

    document.addEventListener('keydown', function (e) {

        if (e.key === 'Escape' && !modall.classList.contains('hidden')) {
            closeModal();
        }
        if (e.key === 'Escape' && !modall2.classList.contains('hidden')) {
            closeModal2();
        }
    });

</script>
</body>
</html>
document.querySelector("#saveButton").addEventListener("click",saveRecordMethod);
loadUsers();
loadLezaljke();
function saveRecordMethod(){
    let korisnik = document.querySelector("#korisnik").value;
    let lezaljka = document.querySelector("#lezaljka").value;
    let params = new FormData();
    params.append("korisnik",korisnik);
    params.append("lezaljka",lezaljka);

    let xhr = new XMLHttpRequest();
    xhr.open('POST', saveMethodUrl, true);
    xhr.send(params);
    //openModalSpinner();
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if(jsonResponse["success"]){
                    Swal.fire({
                        position: 'top-end',
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

function loadUsers(){
    let korisnik= document.querySelector("#korisnik");
    korisnik.innerHTML = "";
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', loadUsersUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if(jsonResponse["success"] === true && jsonResponse["data"].length > 0){
                    jsonResponse["data"].forEach( function (response) {
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

function loadLezaljke(){
    let lezaljka= document.querySelector("#lezaljka");
    lezaljka.innerHTML = "";
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', loadLezaljkesUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if(jsonResponse["success"] === true && jsonResponse["data"].length > 0){
                    jsonResponse["data"].forEach( function (response) {
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

document.querySelector("#saveButton").addEventListener("click", saveRecordMethod);
loadUsers()

function saveRecordMethod() {
    let ime = document.querySelector("#ime").value;
    let prezime = document.querySelector("#prezime").value;
    let mail = document.querySelector("#email").value;
    let params = new FormData();
    params.append("ime", ime);
    params.append("prezime", prezime);
    params.append("email", mail);
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
    let tipLezaljke = document.querySelector("#tipLezaljke");
    tipLezaljke.innerHTML = "";
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', loadTypesUrl, true);
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
                        tipLezaljke.appendChild(option);
                    });
                }
            }
        }
    }
}


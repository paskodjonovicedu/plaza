document.querySelector("#saveButton").addEventListener("click",saveRecordMethod);
function saveRecordMethod(){
let ime = document.querySelector("#ime").value;
let prezime = document.querySelector("#prezime").value;
let mail = document.querySelector("#email").value;
let params = new FormData();
params.append("ime",ime);
params.append("prezime",prezime);
params.append("email",mail);
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
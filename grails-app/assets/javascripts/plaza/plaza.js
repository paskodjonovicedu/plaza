document.querySelector("#saveButton").addEventListener("click",saveRecordMethod);
function saveRecordMethod(){
    let naziv = document.querySelector("#naziv").value;
    let params = new FormData();
    params.append("naziv",naziv);
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
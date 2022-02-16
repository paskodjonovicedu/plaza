loadIstekle();

function loadIstekle() {
    let istekle = document.querySelector("#istekle");
    istekle.innerHTML = "";
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', loadIstekleUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                    jsonResponse["data"].forEach(function (response) {
                        let markup = "<a class=\"dropdown-item d-flex align-items-center\" href=\"#\">" +
                            "<p style='margin-bottom: 0'>" + response.lezaljka + "</p>" +
                            "</a>"
                        istekle.insertAdjacentHTML("afterbegin", markup);
                    });
                    document.querySelector('.izbrisiBadge').innerHTML = jsonResponse["data"].length;
                }
            }
        }
    }
}

let clicked = false;

function otvori() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', clearNotificationUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            clicked = true;
        }
    }
}

function clearNotification() {
    if (clicked) {
        document.querySelector('.izbrisiBadge').innerHTML = '';
        document.querySelector("#istekle").innerHTML = '';
    }
}

package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class MainController {

    def index() {
        render(view: "index")
    }

    def korisnici(){
        render(view: "korisnici")
    }

    def lezaljka() {
        render(view: "lezaljka")
    }
    def plaza() {
        render(view: "plaza")
    }
    def rezervacije() {
        render(view: "rezervacije")
    }
}

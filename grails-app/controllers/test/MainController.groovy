package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class MainController {

    def index() {
        render(view: "index")
    }

    def korisnici() {
        def korisniciList = Korisnik.findAllByIsActive(true)
        render(view: "korisnici", model: [allUsers: korisniciList])
    }

    def lezaljka() {
        def lezaljkeList = Lezaljka.findAllByIsActive(true)
        render(view: "lezaljka", model: [allLez: lezaljkeList])
    }

    def plaza() {
        def plazaList = Plaza.findAllByIsActive(true)
        render(view: "plaza", model: [allBeaches: plazaList])
    }

    def rezervacije() {
        def rezervacijeList = Rezervacije.findAll()
        render(view: "rezervacije", model: [allRes: rezervacijeList])
    }

}

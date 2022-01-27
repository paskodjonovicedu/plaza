package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class MainController {

    def index() {
        def plazaList = Plaza.findAllByIsActive(true)
        render(view: "index", model: [plazaList: plazaList])
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

    def lezaljkeZaPlazu(Long id) {
        if (id) {
            render(view: "lista", model: [idPlaza: id])
        }
    }

//    def rezervisanaLezaljka() {
//        if (params.id) {
//            Lezaljka lezaljka = Lezaljka.get(params.id as Long)
//            def rezervacijaList = Rezervacije.findAllByLezaljka(lezaljka)
//            render(view: 'lista2', model: [rezLista: rezervacijaList])
//        }
//    }
}

package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class MainController {
    DailyTasksService dailyTasksService

    def index() {
        dailyTasksService.deleteAllReservation()

        def plazaList = Plaza.findAllByIsActive(true)
        render(view: "index", model: [plazaList: plazaList])
    }

    def korisnici() {
        dailyTasksService.deleteAllReservation()

        def korisniciList = Korisnik.findAllByIsActive(true)
        render(view: "korisnici", model: [allUsers: korisniciList])
    }

    def lezaljka() {
        dailyTasksService.deleteAllReservation()

        def lezaljkeList = Lezaljka.findAllByIsActive(true)
        render(view: "lezaljka", model: [allLez: lezaljkeList])
    }

    def plaza() {
        dailyTasksService.deleteAllReservation()

        def plazaList = Plaza.findAllByIsActive(true)
        render(view: "plaza", model: [allBeaches: plazaList])
    }

    def rezervacije() {
        dailyTasksService.deleteAllReservation()

        def rezervacijeList = Rezervacije.findAll()
        render(view: "rezervacije", model: [allRes: rezervacijeList])
    }

    def lezaljkeZaPlazu(Long id) {
        if (id) {
            render(view: "lista", model: [idPlaza: id])
        }
    }

    def rezervacijeZaLezaljku(long id) {
        if (id) {
            render(view: 'lista', model: [idLezaljka: id])
        }
    }

}

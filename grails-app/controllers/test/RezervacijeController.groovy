package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class RezervacijeController {
    def saveRecord() {
        Rezervacije rezervacije = new Rezervacije()
        rezervacije.korisnik = Korisnik.get(params.korisnik as Long)
        rezervacije.lezaljka = Lezaljka.get(params.lezaljka as Long)
        rezervacije.datumPocetka = params.datumPocetka as Date
        rezervacije.datumKraja = params.datumKraja as Date
        rezervacije.save()
        render([success: true, message: "Uspjesno ste rezervisali!"] as JSON)

    }

    def getAllUsers() {
        def data = []
        def allUsers = Korisnik.findAllByIsActive(true)
        allUsers.each { user ->
            data += [id: user.id, name: user.ime]
        }
        render([success: true, data: data] as JSON)
    }

    def getAllBeaches() {
        def data = []
        def allBeaches = Plaza.findAllByIsActive(true)
        allBeaches.each { beach ->
            data += [id: beach.id, name: beach.naziv]
        }
        render([success: true, data: data] as JSON)
    }

    def deleteReservation() {
        try {
            Rezervacije rezervacije = Rezervacije.findByLezaljka(Lezaljka.get(params.id as Long))
            if (rezervacije) {
                rezervacije.delete()
            }
            render([success: true, message: "Uspješno ste izbrisali rezervaciju!"] as JSON)
        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }

    }

}

package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class DailyTasksService {

    def deleteAllReservation() {
        Date today = new Date()
        def list = Rezervacije.findAllByDatumKrajaLessThan(today)
        list.each { a ->
            new IstekleRezervacije(korisnik: a.korisnik, lezaljka: a.lezaljka, datumPocetka: a.datumPocetka, datumKraja: a.datumKraja).save()
            a.delete()
        }
        return ([success: true, message: "Uspješno ste izbrisali!"] as JSON)
    }
}

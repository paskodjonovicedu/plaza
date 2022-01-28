package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class LezaljkaController {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm")

    def saveRecord() {
        Lezaljka lezaljka = new Lezaljka()
        lezaljka.tipLezaljke = TipLezaljke.get(params.tipLezaljke as Long)
        lezaljka.plaza = Plaza.get(params.plaza as Long)
        lezaljka.cijena = params.cijena as Double
        lezaljka.save()
        render([success: true, message: "Uspjesno ste kreirali lezaljku!"] as JSON)
    }

    def getAllTypes() {
        def data = []
        def allTypes = TipLezaljke.findAllByIsActive(true)
        allTypes.each { type ->
            data += [id: type.id, name: type.naziv]
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

    def saveBeach() {
        println params
        Rezervacije rezervacije = new Rezervacije()
        rezervacije.lezaljka = Lezaljka.get(params.lezaljka as Long)
        rezervacije.korisnik = Korisnik.get(params.korisnik as Long)
        rezervacije.datumPocetka = sdf.parse(params.datumPocetka)
        rezervacije.datumKraja = sdf.parse(params.datumKraja)
        rezervacije.save()
        render([success: true, message: "Uspješno ste napravili rezervaciju!"] as JSON)
    }

    def getAllLezaljke() {
        def data = []
        def allLezaljke = Lezaljka.findAllByIsActive(true)
        allLezaljke.each { l ->
            data += [id: l.id, name: l.plaza?.naziv + " / " + l.id.toString()]
        }
        render([success: true, data: data] as JSON)
    }

    def findAllLezaljkeForBeach() {
        Date today = new Date()
        def data = []
        def allLezaljke = Lezaljka.findAllByPlaza(Plaza.get(params.idPlaza as Long))
        allLezaljke.each { a ->
            def rezervacije = Rezervacije.findByLezaljkaAndDatumKrajaGreaterThan(a, today)
            if (rezervacije) {
                data += [id: a.id, name: a.tipLezaljke?.naziv, active: true]
            } else {
                data += [id: a.id, name: a.tipLezaljke?.naziv, active: false]
            }
        }
        render([success: true, data: data] as JSON)
    }

    def findAllRezervacijeForLezaljka() {
        Date today = new Date()
        Rezervacije a = Rezervacije.findByLezaljkaAndDatumKrajaGreaterThan(Lezaljka.get(params.idLezaljka as Long),today)
        def data =[id: a.id, name: a.korisnik.ime + ' ' + a.korisnik.prezime, lezaljka: a.lezaljka.plaza.naziv + " / " + a.lezaljka.id, datumPocetka: a.datumPocetka, datumKraja: a.datumKraja]
        render([success: true, data: data] as JSON)
    }
}
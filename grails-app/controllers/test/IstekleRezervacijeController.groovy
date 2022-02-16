package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Transactional
class IstekleRezervacijeController {

    def istekleRezervacije() {
        def data = []
        def rezervacije = IstekleRezervacije.findAllByIsNotified(false)
        rezervacije.each {rez ->
            data += [id: rez.id, lezaljka: rez.lezaljka.plaza.naziv + " / " + rez.datumKraja, datumPocetka: rez.datumPocetka, datumKraja: rez.datumKraja]
        }
        render([success: true, data: data] as JSON)
    }

    def istekleRezervacije2 () {
        def data = []
        def rezervacije = IstekleRezervacije.findAllByIsNotified(true)
        rezervacije.each {rez ->
            data += [id: rez.id, lezaljka: rez.lezaljka.plaza.naziv + " / " + rez.datumKraja, datumPocetka: rez.datumPocetka, datumKraja: rez.datumKraja]
        }
        render([success: true, data: data] as JSON)
    }

    def clearNotification(){
        def istekleRez = IstekleRezervacije.findAllByIsNotified(false)
        istekleRez.each { rez->
            rez.isNotified = true
            rez.save()
        }
        render([success: true] as JSON)
    }
}

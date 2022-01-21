package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class KorisnikController {

    def save(){
            Korisnik korisnik = new Korisnik()
            korisnik.ime = params.ime
            korisnik.prezime = params.prezime
            korisnik.mail = params.email
            korisnik.save()
            render([success:true,message: "Uspješno ste kreirali korisnika."] as JSON )
    }
}

package test

class Rezervacije {
    Korisnik korisnik
    Lezaljka lezaljka
    Date dateCreated
    Date lastUpdated
    Date datumPocetka
    Date datumKraja

    static constraints = {
        datumPocetka nullable: true
        datumKraja nullable: true
    }
}

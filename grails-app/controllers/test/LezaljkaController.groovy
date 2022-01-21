package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class LezaljkaController {
    def saveRecord() {
        Lezaljka lezaljka = new Lezaljka()
        lezaljka.tipLezaljke = TipLezaljke.get(params.tipLezaljke as Long)
        lezaljka.plaza = Plaza.get(params.plazaId as Long)
        lezaljka.cijena = params.cijena as Double
        lezaljka.save()
        render([success: true, message: "Uspjesno ste kreirali lezaljku!"] as JSON)
    }

    def getAllTypes(){
        def data = []
        def allTypes = TipLezaljke.findAllByIsActive(true)
        allTypes.each { type->
            data += [id: type.id,name: type.naziv]
        }
        render([success:true,data: data] as JSON)
    }
    def getAllBeaches() {
        def data = []
        def allTypes = Plaza.findAllByIsActive(true)
    }
}
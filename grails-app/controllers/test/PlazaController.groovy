package test

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Transactional
class PlazaController {
    def save() {
        Plaza plaza = new Plaza()
        plaza.naziv = params.naziv
        plaza.save()
        render([success:true,message:"Uspjesno ste kreirali plazu"] as JSON)
    }

}

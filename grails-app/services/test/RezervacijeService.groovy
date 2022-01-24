package test

import grails.gorm.services.Service

@Service(Rezervacije)
interface RezervacijeService {

    Rezervacije get(Serializable id)

    List<Rezervacije> list(Map args)

    Long count()

    void delete(Serializable id)

    Rezervacije save(Rezervacije rezervacije)

}
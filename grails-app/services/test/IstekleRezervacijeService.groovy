package test

import grails.gorm.services.Service

@Service(IstekleRezervacije)
interface IstekleRezervacijeService {

    IstekleRezervacije get(Serializable id)

    List<IstekleRezervacije> list(Map args)

    Long count()

    void delete(Serializable id)

    IstekleRezervacije save(IstekleRezervacije istekleRezervacije)

}
package test

import grails.gorm.services.Service

@Service(Plaza)
interface PlazaService {

    Plaza get(Serializable id)

    List<Plaza> list(Map args)

    Long count()

    void delete(Serializable id)

    Plaza save(Plaza plaza)

}
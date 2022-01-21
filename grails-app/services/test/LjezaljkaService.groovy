package test

import grails.gorm.services.Service

@Service(Lezaljka)
interface LjezaljkaService {

    Lezaljka get(Serializable id)

    List<Lezaljka> list(Map args)

    Long count()

    void delete(Serializable id)

    Lezaljka save(Lezaljka ljezaljka)

}
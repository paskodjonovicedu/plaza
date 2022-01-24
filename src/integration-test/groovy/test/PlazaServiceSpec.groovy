package test

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PlazaServiceSpec extends Specification {

    PlazaService plazaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Plaza(...).save(flush: true, failOnError: true)
        //new Plaza(...).save(flush: true, failOnError: true)
        //Plaza plaza = new Plaza(...).save(flush: true, failOnError: true)
        //new Plaza(...).save(flush: true, failOnError: true)
        //new Plaza(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //plaza.id
    }

    void "test get"() {
        setupData()

        expect:
        plazaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Plaza> plazaList = plazaService.list(max: 2, offset: 2)

        then:
        plazaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        plazaService.count() == 5
    }

    void "test delete"() {
        Long plazaId = setupData()

        expect:
        plazaService.count() == 5

        when:
        plazaService.delete(plazaId)
        sessionFactory.currentSession.flush()

        then:
        plazaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Plaza plaza = new Plaza()
        plazaService.save(plaza)

        then:
        plaza.id != null
    }
}

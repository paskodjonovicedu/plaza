package test

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RezervacijeServiceSpec extends Specification {

    RezervacijeService rezervacijeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Rezervacije(...).save(flush: true, failOnError: true)
        //new Rezervacije(...).save(flush: true, failOnError: true)
        //Rezervacije rezervacije = new Rezervacije(...).save(flush: true, failOnError: true)
        //new Rezervacije(...).save(flush: true, failOnError: true)
        //new Rezervacije(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //rezervacije.id
    }

    void "test get"() {
        setupData()

        expect:
        rezervacijeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Rezervacije> rezervacijeList = rezervacijeService.list(max: 2, offset: 2)

        then:
        rezervacijeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        rezervacijeService.count() == 5
    }

    void "test delete"() {
        Long rezervacijeId = setupData()

        expect:
        rezervacijeService.count() == 5

        when:
        rezervacijeService.delete(rezervacijeId)
        sessionFactory.currentSession.flush()

        then:
        rezervacijeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Rezervacije rezervacije = new Rezervacije()
        rezervacijeService.save(rezervacije)

        then:
        rezervacije.id != null
    }
}

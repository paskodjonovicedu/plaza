package test

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class IstekleRezervacijeServiceSpec extends Specification {

    IstekleRezervacijeService istekleRezervacijeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new IstekleRezervacije(...).save(flush: true, failOnError: true)
        //new IstekleRezervacije(...).save(flush: true, failOnError: true)
        //IstekleRezervacije istekleRezervacije = new IstekleRezervacije(...).save(flush: true, failOnError: true)
        //new IstekleRezervacije(...).save(flush: true, failOnError: true)
        //new IstekleRezervacije(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //istekleRezervacije.id
    }

    void "test get"() {
        setupData()

        expect:
        istekleRezervacijeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<IstekleRezervacije> istekleRezervacijeList = istekleRezervacijeService.list(max: 2, offset: 2)

        then:
        istekleRezervacijeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        istekleRezervacijeService.count() == 5
    }

    void "test delete"() {
        Long istekleRezervacijeId = setupData()

        expect:
        istekleRezervacijeService.count() == 5

        when:
        istekleRezervacijeService.delete(istekleRezervacijeId)
        sessionFactory.currentSession.flush()

        then:
        istekleRezervacijeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        IstekleRezervacije istekleRezervacije = new IstekleRezervacije()
        istekleRezervacijeService.save(istekleRezervacije)

        then:
        istekleRezervacije.id != null
    }
}

package test

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class LezaljkaServiceSpec extends Specification {

    LjezaljkaService ljezaljkaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Lezaljka(...).save(flush: true, failOnError: true)
        //new Lezaljka(...).save(flush: true, failOnError: true)
        //Lezaljka ljezaljka = new Lezaljka(...).save(flush: true, failOnError: true)
        //new Lezaljka(...).save(flush: true, failOnError: true)
        //new Lezaljka(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //ljezaljka.id
    }

    void "test get"() {
        setupData()

        expect:
        ljezaljkaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Lezaljka> ljezaljkaList = ljezaljkaService.list(max: 2, offset: 2)

        then:
        ljezaljkaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        ljezaljkaService.count() == 5
    }

    void "test delete"() {
        Long ljezaljkaId = setupData()

        expect:
        ljezaljkaService.count() == 5

        when:
        ljezaljkaService.delete(ljezaljkaId)
        sessionFactory.currentSession.flush()

        then:
        ljezaljkaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Lezaljka ljezaljka = new Lezaljka()
        ljezaljkaService.save(ljezaljka)

        then:
        ljezaljka.id != null
    }
}

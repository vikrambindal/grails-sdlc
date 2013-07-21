package process



import org.junit.*
import grails.test.mixin.*

/**
 * EffortControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EffortController)
@Mock(Effort)
class EffortControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/effort/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.effortInstanceList.size() == 0
        assert model.effortInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.effortInstance != null
    }

    void testSave() {
        controller.save()

        assert model.effortInstance != null
        assert view == '/effort/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/effort/show/1'
        assert controller.flash.message != null
        assert Effort.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/effort/list'


        populateValidParams(params)
        def effort = new Effort(params)

        assert effort.save() != null

        params.id = effort.id

        def model = controller.show()

        assert model.effortInstance == effort
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/effort/list'


        populateValidParams(params)
        def effort = new Effort(params)

        assert effort.save() != null

        params.id = effort.id

        def model = controller.edit()

        assert model.effortInstance == effort
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/effort/list'

        response.reset()


        populateValidParams(params)
        def effort = new Effort(params)

        assert effort.save() != null

        // test invalid parameters in update
        params.id = effort.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/effort/edit"
        assert model.effortInstance != null

        effort.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/effort/show/$effort.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        effort.clearErrors()

        populateValidParams(params)
        params.id = effort.id
        params.version = -1
        controller.update()

        assert view == "/effort/edit"
        assert model.effortInstance != null
        assert model.effortInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/effort/list'

        response.reset()

        populateValidParams(params)
        def effort = new Effort(params)

        assert effort.save() != null
        assert Effort.count() == 1

        params.id = effort.id

        controller.delete()

        assert Effort.count() == 0
        assert Effort.get(effort.id) == null
        assert response.redirectedUrl == '/effort/list'
    }
}

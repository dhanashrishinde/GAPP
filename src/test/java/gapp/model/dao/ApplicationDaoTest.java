/*package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "ApplicationDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	@Autowired
    ApplicationDao appDao;

	
	@Test
    public void getApplications()
    {
		Integer id = appDao.getDept("Accounting").getId();
		assert appDao.getApplicationNo(id, "Fall 2016").size() == 1;
		
    }
	
	
}
*/
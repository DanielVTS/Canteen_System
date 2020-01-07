import cn.lingnan.mapper.CustomerMapper;

import cn.lingnan.mapper.StaffMapper;
import cn.lingnan.pojo.Customer;

import cn.lingnan.pojo.Staff;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;

public class AppTest01 {
    public SqlSessionFactory getSqlSessionFactory () throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream= Resources.getResourceAsStream(resource);
        return new SqlSessionFactoryBuilder().build(inputStream);
    }
    @Test
    public void t01() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        StaffMapper staffMapper = sqlSession.getMapper(StaffMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Staff staff = ctx.getBean(Staff.class);
        staff.setStaffName("1");
        staff.setStaffPassword("123");
        System.out.println(staffMapper.queryAll());
    }

}

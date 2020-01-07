import cn.lingnan.mapper.CustomerMapper;

import cn.lingnan.mapper.OrderListMapper;
import cn.lingnan.mapper.StaffMapper;
import cn.lingnan.pojo.Customer;

import cn.lingnan.pojo.OrderList;
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
        System.out.println(staffMapper.add(staff));
        System.out.println(staffMapper.queryAll());
    }

    @Test
    public void t02() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Customer customer = ctx.getBean(Customer.class);
        customer.setCustomerName("1");
        customer.setCustomerPassword("123");
        customer.setEmail("111");
        customer.setPhone("111");
        System.out.println(customerMapper.register(customer));
        System.out.println(customerMapper.queryAll());
    }

    @Test
    public void t03() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        OrderListMapper orderListMapper = sqlSession.getMapper(OrderListMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        OrderList orderList = ctx.getBean(OrderList.class);
        orderList.setOrderNo("01");
        orderList.setOrderStatus(1);
        System.out.println(orderListMapper.query(orderList));
//        System.out.println(orderListMapper.queryAll());
//        System.out.println(customerMapper.queryAll());
    }
    @Test
    public void t04() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        OrderListMapper orderListMapper = sqlSession.getMapper(OrderListMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        OrderList orderList = ctx.getBean(OrderList.class);
        orderList.setOrderNo("01");
        orderList.setOrderStatus(2);
        orderList.setOrderId(2);

        System.out.println(orderListMapper.delete(2));

    }
}

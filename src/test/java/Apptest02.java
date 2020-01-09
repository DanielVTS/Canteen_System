import cn.lingnan.mapper.MenuMapper;
import cn.lingnan.mapper.TableMapper;
import cn.lingnan.pojo.Menu;
import cn.lingnan.pojo.Table;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;

public class Apptest02 {
    public SqlSessionFactory getSqlSessionFactory () throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream= Resources.getResourceAsStream(resource);
        return new SqlSessionFactoryBuilder().build(inputStream);
    }
    @Test
    public void t01() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Menu menu = ctx.getBean(Menu.class);
        menu.setMenuName("1");
        menu.setMenuCategory("123");
        System.out.println(menuMapper.add(menu));
        System.out.println(menuMapper.queryAll());
    }

    @Test
    public void t02() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Menu menu = ctx.getBean(Menu.class);
        menu.setMenuId(1);
        menu.setMenuCategory("123");
        System.out.println(menuMapper.update(menu));
        System.out.println(menuMapper.queryAll());
    }
    @Test
    public void t03() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Menu menu = ctx.getBean(Menu.class);
        menu.setMenuId(1);
        menu.setMenuName("1");
        menu.setMenuCategory("1");
//        menu.setMenuStaus(1);
        menu.setPrice(1);
        menu.setPicture("1");
        System.out.println(menuMapper.query(menu));
//        System.out.println(menuMapper.queryAll());
    }
    @Test
    public void t04() throws IOException {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        TableMapper tableMapper = sqlSession.getMapper(TableMapper.class);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
        Table table = ctx.getBean(Table.class);
        table.setTableId(1);
        table.setTableName("2");
        table.setTableSeat("2");
//        table.setTableStaus(2);
        table.setPhone("2");
        System.out.println(tableMapper.update(table));
        System.out.println(tableMapper.queryAll());
    }
}

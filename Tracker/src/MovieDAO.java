import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class MovieDAO {

    private Session session;
    private SessionFactory sessionFactory;

    public MovieDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public void registerMovie(){

    }

    public Movie searchMovie(){
        return null;
    }

}
